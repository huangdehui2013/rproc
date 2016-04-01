package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/exec"
	"strings"
	"time"

	"github.com/eldarion-gondor/piper"
	"github.com/gorilla/websocket"
)

var secret = flag.String("secret", "", "")
var buildTag string

var upgrader = websocket.Upgrader{
	ReadBufferSize:  8192,
	WriteBufferSize: 8192,
}

func main() {
	logger := log.New(os.Stderr, "", log.LstdFlags)
	flag.Parse()
	if len(flag.Args()) == 0 {
		fmt.Println("no program to exec")
		os.Exit(1)
	}
	timer := time.NewTimer(15 * time.Second)
	done := make(chan bool)
	http.HandleFunc("/ok", func(rw http.ResponseWriter, req *http.Request) {
		rw.WriteHeader(http.StatusOK)
	})
	http.HandleFunc("/", func(rw http.ResponseWriter, req *http.Request) {
		defer func() { done <- true }()
		timer.Stop()
		ws, err := upgrader.Upgrade(rw, req, nil)
		if err != nil {
			logger.Printf("upgrade error: %s", err)
			return
		}
		pipe, err := piper.NewServerPipe(req, ws, logger)
		if err != nil {
			logger.Printf("pipe error: %s", err)
			ws.Close()
			return
		}
		logger.Printf("exec: %s", strings.Join(flag.Args(), " "))
		cmd := exec.Command(flag.Arg(0), flag.Args()[1:]...)
		if err := pipe.RunCmd(cmd); err != nil {
			logger.Printf("exec error: %s", err)
			pipe.Close("error")
			return
		}
		logger.Println("done")
		pipe.Close("done")
	})
	go func() {
		if err := http.ListenAndServe(":8000", nil); err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	}()
	select {
	case <-done:
		os.Exit(0)
	case <-timer.C:
		logger.Println("timed out waiting for connection")
		os.Exit(1)
	}
}

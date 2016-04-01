#!/bin/bash
set -ev

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh
. $here/_gopath.sh

CGO_ENABLED=0 go build $GO_BUILD_FLAGS -installsuffix cgo -ldflags "-s" -o bin/rproc $REPO_PATH

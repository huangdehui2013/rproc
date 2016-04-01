ORG_PATH="github.com/kelproject"
REPO_PATH="${ORG_PATH}/rproc"
export GOPATH=${PWD}/gopath

setup_gopath() {
    rm -f $GOPATH/src/${REPO_PATH}
    mkdir -p $GOPATH/src/${ORG_PATH}
    ln -s ${PWD} $GOPATH/src/${REPO_PATH}
}

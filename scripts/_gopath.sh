export GOPATH=${PWD}/gopath

setup_gopath() {
    rm -f $GOPATH/src/${REPO_PATH}
    mkdir -p $GOPATH/src/${ORG_PATH}
    ln -s ${PWD} $GOPATH/src/${REPO_PATH}
}

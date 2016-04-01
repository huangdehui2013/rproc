#!/bin/bash
set -ex

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh
. $here/_gopath.sh

setup_gopath

# install glide
wget https://github.com/Masterminds/glide/releases/download/0.10.1/glide-0.10.1-linux-amd64.tar.gz
tar -vxz -C $HOME/bin --strip=1 -f glide-0.10.1-linux-amd64.tar.gz

glide install

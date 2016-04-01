#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh
. $here/_gopath.sh

setup_gopath

echo -n "Installing glide... "
(
    mkdir -p $HOME/bin
    wget -q https://github.com/Masterminds/glide/releases/download/0.10.1/glide-0.10.1-linux-amd64.tar.gz
    tar -xz -C $HOME/bin --strip=1 -f glide-0.10.1-linux-amd64.tar.gz
) && echo "done"
export PATH="$HOME/bin:${PATH}"

echo "Installing glide dependencies..."
glide install

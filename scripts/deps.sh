#!/bin/bash
set -ex

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh
. $here/_gopath.sh

setup_gopath

glide install

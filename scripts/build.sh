#!/bin/bash
set -ev

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

docker run -i --volume "$(pwd):/src" quay.io/kelproject/gb-build

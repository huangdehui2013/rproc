#!/bin/bash
set -ev

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

gsutil cp bin/rproc gs://release.kelproject.com/binaries/rproc/rproc-linux-amd64-$BUILD_TAG

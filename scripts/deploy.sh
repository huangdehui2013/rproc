#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

echo -n "Uploading rproc $BUILD_TAG... "
gsutil -q cp bin/rproc gs://release.kelproject.com/binaries/rproc/rproc-linux-amd64-$BUILD_TAG && echo "done"

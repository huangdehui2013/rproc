#!/bin/bash
set -e

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

echo -n "Uploading $PROJECT $BUILD_TAG... "
gsutil -q cp bin/$PROJECT gs://release.kelproject.com/binaries/$PROJECT/$PROJECT-linux-amd64-$BUILD_TAG && echo "done"

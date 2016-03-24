#!/bin/bash
set -e

if [ -n "$TRAVIS_TAG" ]; then
    BUILD_TAG="$TRAVIS_TAG"
else
    BUILD_TAG="git-${TRAVIS_COMMIT:0:8}"
fi

gsutil cp bin/rproc gs://kel-tester/rproc-linux-amd64-$BUILD_TAG

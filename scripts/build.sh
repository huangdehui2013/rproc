#!/bin/bash
set -ev

if [ -n "$TRAVIS_TAG" ]; then
    BUILD_TAG="$TRAVIS_TAG"
else
    BUILD_TAG="git-${TRAVIS_COMMIT:0:8}"
fi

docker run -i --volume "$(pwd):/src" quay.io/kelproject/gb-build

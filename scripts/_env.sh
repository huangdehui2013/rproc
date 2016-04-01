PROJECT="rproc"
ORG_PATH="github.com/kelproject"
REPO_PATH="${ORG_PATH}/${PROJECT}"

if [ -n "$TRAVIS_TAG" ]; then
    BUILD_TAG="$TRAVIS_TAG"
else
    BUILD_TAG="git-${TRAVIS_COMMIT:0:8}"
fi

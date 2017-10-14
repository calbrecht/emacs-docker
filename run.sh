#!/usr/bin/env bash

VERSION=${1}
shift
EMACS_VERSION=${1}
shift

docker run -it -v ${PWD}:/data:rw evm/emacs-${EMACS_VERSION}-travis:${VERSION} "${@}"

#!/usr/bin/env bash

BUILD=0.0.1
VERSIONS="24.3 24.4 24.5 25.1 25.2 25.3 git-snapshot"

docker build --tag evm/emacs-base evm

cat | tee all-test > all <<-'EOF'
	#!/usr/bin/env bash
	set -e
	version=
	fail() { echo Failing version: ${version} ; }
	trap fail ERR
EOF
chmod +x all all-test

for version in  ${VERSIONS} ; do
    docker build --build-arg EMACS_VERSION=emacs-${version}-travis \
           --tag evm/emacs-${version}-travis:${BUILD} evm/emacs

    cat > ${version} <<-EOF
	#!/usr/bin/env bash
	${PWD}/run.sh ${BUILD} ${version} "\${@}"
EOF
    chmod +x ${version}

    echo version=${version} | tee -a all-test >> all
    echo ${PWD}/${version} '"${@}"' >> all
    echo EMACS=${PWD}/${version} make test >> all-test
done

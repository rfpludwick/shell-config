#!/bin/bash -e

mkdir -pv "${HOME}"/.shell-config
pushd "${HOME}"/.shell-config
curl -o shell-config.tgz https://codeload.github.com/rfpludwick/shell-config/tar.gz/main
tar -xvf shell-config.tgz --strip-components=1
rm -v shell-config.tgz
popd
"${HOME}"/.shell-config/bash/install/main.sh

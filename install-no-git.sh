#!/usr/bin/env bash

mkdir -p ~/.bash-config
pushd ~/.bash-config
curl -o bash-config.tgz https://codeload.github.com/rfpludwick/bash-config/tar.gz/main
tar -xvf bash-config.tgz --strip-components=1
rm bash-config.tgz
popd
~/.bash-config/install.sh

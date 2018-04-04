#!/usr/bin/env bash

mkdir ~/.bash-config
pushd ~/.bash-config
wget https://github.com/rfpludwick/bash-config/archive/master.tar.gz
tar -xvf master.tar.gz --strip-components=1
rm master.tar.gz
./install.sh
popd

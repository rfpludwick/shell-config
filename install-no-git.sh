#!/usr/bin/env bash

mkdir .bash-config
wget -qO- https://github.com/rfpludwick/bash-config/archive/master.tar.gz | tar -xvf -C .bash-config --strip-components=1
./install.sh

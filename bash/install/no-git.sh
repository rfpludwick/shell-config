#!/usr/bin/env bash

set -exo pipefail

mkdir --parents "${HOME}"/.shell-config
pushd "${HOME}"/.shell-config
curl --location https://codeload.github.com/rfpludwick/shell-config/tar.gz/main --output shell-config.tgz
tar --extract --gzip --file shell-config.tgz --strip-components=1
rm shell-config.tgz
popd

# shellcheck disable=SC1091
"${HOME}"/.shell-config/bash/install/main.sh

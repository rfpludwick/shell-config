#!/usr/bin/env bash

set -e
set -o pipefail

SUDO_STARSHIP_INSTALL=""

while getopts "s" options; do
	case "${options}" in
		s)
			SUDO_STARSHIP_INSTALL="-s"
			;;
		*)
			echo Unsupported getopts
			exit 1
			;;
	esac
done
shift $((OPTIND-1))

mkdir -pv "${HOME}"/.shell-config
pushd "${HOME}"/.shell-config
curl -o shell-config.tgz https://codeload.github.com/rfpludwick/shell-config/tar.gz/main
tar -xvf shell-config.tgz --strip-components=1
rm -v shell-config.tgz
popd

# shellcheck disable=SC1091
"${HOME}"/.shell-config/bash/install/main.sh "${SUDO_STARSHIP_INSTALL}"

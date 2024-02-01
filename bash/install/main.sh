#!/usr/bin/env bash

set -exo pipefail

if [ "$EUID" -ne 0 ] || grep --quiet docker /proc/1/cgroup || [ -f /.dockerenv ]; then
	echo Installing Starship and coreutils

	if brew commands &> /dev/null; then
		brew install starship coreutils
	else
		sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -f
	fi
fi

# Create config directory for Starship, if necessary
if [ ! -d "${HOME}"/.config ]; then
	echo Creating user config directory

	mkdir "${HOME}"/.config
fi

echo Archiving old Bash configuration...

# Check if we're archiving an old installation directory first
if [ -d "${HOME}"/.bash-config-archive ]; then
	echo Removing old shell config archive directory

	rm --recursive --force "${HOME}"/.shell-config-archive
fi

if [ -d "${HOME}"/.bash-config ]; then
	echo Archiving existing bash config directory

	mv "${HOME}"/.bash-config "${HOME}"/.shell-config-archive
elif [ ! -d "${HOME}"/.shell-config-archive ]; then
	echo Creating shell config archive directory

	mkdir "${HOME}"/.shell-config-archive
fi

# Archive files
if [ -f "${HOME}"/.bash_aliases ] && [ ! -L "${HOME}"/.bash_aliases ]; then
	echo Archiving existing bash aliases

	mv "${HOME}"/.bash_aliases "${HOME}"/.shell-config-archive/bash_aliases
fi

if [ -f "${HOME}"/.bash_exports ] && [ ! -L "${HOME}"/.bash_exports ]; then
	echo Archiving existing bash exports

	mv "${HOME}"/.bash_exports "${HOME}"/.shell-config-archive/bash_exports
fi

if [ -f "${HOME}"/.bash_logout ] && [ ! -L "${HOME}"/.bash_logout ]; then
	echo Archiving existing bash logout

	mv "${HOME}"/.bash_logout "${HOME}"/.shell-config-archive/bash_logout
fi

if [ -f "${HOME}"/.bash_profile ] && [ ! -L "${HOME}"/.bash_profile ]; then
	echo Archiving existing bash profile

	mv "${HOME}"/.bash_profile "${HOME}"/.shell-config-archive/bash_profile
fi

if [ -f "${HOME}"/.bashrc ] && [ ! -L "${HOME}"/.bashrc ]; then
	echo Archiving existing bashrc

	mv "${HOME}"/.bashrc "${HOME}"/.shell-config-archive/bashrc
fi

if [ -f "${HOME}"/.config/starship.toml ] && [ ! -L "${HOME}"/.config/starship.toml ]; then
	echo Archiving existing Starship configuration

	mv "${HOME}"/.config/starship.toml "${HOME}"/.shell-config-archive/starship.toml
fi

if [ -f "${HOME}"/.vimrc ] && [ ! -L "${HOME}"/.vimrc ]; then
	echo Archiving existing vimrc

	mv "${HOME}"/.vimrc "${HOME}"/.shell-config-archive/vimrc
fi

echo Checking and symlinking repository

REPOSITORY_DIRECTORY="$(dirname "$(dirname "$(dirname "$(realpath "${0}")")")")"

if [ "${REPOSITORY_DIRECTORY}" != "${HOME}"/.shell-config ]; then
	ln -snf "${REPOSITORY_DIRECTORY}" "${HOME}"/.shell-config
fi

echo Installing new Bash configuration...

ln -snf "${HOME}"/.shell-config/bash/aliases "${HOME}"/.bash_aliases
ln -snf "${HOME}"/.shell-config/bash/exports "${HOME}"/.bash_exports
ln -snf "${HOME}"/.shell-config/bash/logout "${HOME}"/.bash_logout
ln -snf "${HOME}"/.shell-config/bash/profile "${HOME}"/.bash_profile
ln -snf "${HOME}"/.shell-config/starship.toml "${HOME}"/.config/starship.toml
ln -snf "${HOME}"/.shell-config/vimrc "${HOME}"/.vimrc
ln -snf "${HOME}"/.bash_profile "${HOME}"/.bashrc

echo Sourcing...

# shellcheck disable=SC1090 disable=SC1091
source "${HOME}"/.bashrc

echo Done

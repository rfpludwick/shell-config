#!/bin/bash -e

if [ "$EUID" -ne 0 ] || grep --quiet docker /proc/1/cgroup; then
	echo Installing Starship and coreutils

	if brew commands &> /dev/null; then
		brew install starship coreutils
	else
		sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -f
	fi
fi

if [ ! -d "${HOME}"/.config ]; then
	mkdir -v "${HOME}"/.config
fi

echo Archiving old Bash configuration...

# Check if we're archiving an old installation directory first
if [ -d "${HOME}/.bash-config" ]; then
	mv -v "${HOME}/.bash-config" "${HOME}/.shell-config-archive"
elif [ ! -d "${HOME}"/.shell-config-archive ]; then
	mkdir -v "${HOME}"/.shell-config-archive
fi

if [ -f "${HOME}"/.bash_aliases ] && [ ! -L "${HOME}"/.bash_aliases ]; then
	mv -v "${HOME}"/.bash_aliases "${HOME}"/.shell-config-archive/bash_aliases
fi

if [ -f "${HOME}"/.bash_exports ] && [ ! -L "${HOME}"/.bash_exports ]; then
	mv -v "${HOME}"/.bash_exports "${HOME}"/.shell-config-archive/bash_exports
fi

if [ -f "${HOME}"/.bash_logout ] && [ ! -L "${HOME}"/.bash_logout ]; then
	mv -v "${HOME}"/.bash_logout "${HOME}"/.shell-config-archive/bash_logout
fi

if [ -f "${HOME}"/.bash_profile ] && [ ! -L "${HOME}"/.bash_profile ]; then
	mv -v "${HOME}"/.bash_profile "${HOME}"/.shell-config-archive/bash_profile
fi

if [ -f "${HOME}"/.bashrc ] && [ ! -L "${HOME}"/.bashrc ]; then
	mv -v "${HOME}"/.bashrc "${HOME}"/.shell-config-archive/bashrc
fi

if [ -f "${HOME}"/.config/starship.toml ] && [ ! -L "${HOME}"/.config/starship.toml ]; then
	mv -v "${HOME}"/.config/starship.toml "${HOME}"/.shell-config-archive/starship.toml
fi

if [ -f "${HOME}"/.vimrc ] && [ ! -L "${HOME}"/.vimrc ]; then
	mv -v "${HOME}"/.vimrc "${HOME}"/.shell-config-archive/vimrc
fi

echo Checking and symlinking repository

REPOSITORY_DIRECTORY="$(dirname "$(dirname "$(dirname "$(realpath "${0}")")")")"

if [ "${REPOSITORY_DIRECTORY}" != "${HOME}"/.shell-config ]; then
	ln -snfv "${REPOSITORY_DIRECTORY}" "${HOME}"/.shell-config
fi

echo Installing new Bash configuration...

ln -snfv "${HOME}"/.shell-config/bash/aliases "${HOME}"/.bash_aliases
ln -snfv "${HOME}"/.shell-config/bash/exports "${HOME}"/.bash_exports
ln -snfv "${HOME}"/.shell-config/bash/logout "${HOME}"/.bash_logout
ln -snfv "${HOME}"/.shell-config/bash/profile "${HOME}"/.bash_profile
ln -snfv "${HOME}"/.shell-config/starship.toml "${HOME}"/.config/starship.toml
ln -snfv "${HOME}"/.shell-config/vimrc "${HOME}"/.vimrc
ln -snfv "${HOME}"/.bash_profile "${HOME}"/.bashrc

echo Sourcing...

# shellcheck disable=SC1091
source "${HOME}"/.bashrc

echo Done

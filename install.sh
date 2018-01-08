#!/bin/sh
set -eu

DOTFILES="${HOME}/.dotfiles"
GIT_REPOSITORY='https://github.com/ryouser/dotfiles.git'
ZIP_URL='https://github.com/ryouser/dotfiles/archive/master.zip'

if ! which git >/dev/null; then
	echo 'git is not installed or not in the $PATH' >&2
	exit 1
fi

git clone --recursive "${GIT_REPOSITORY}" "${DOTFILES}"
cd "${DOTFILES}"
git config user.name 'ryouser'
git config user.email '35141868+ryouser@users.noreply.github.com'

"${DOTFILES}/deploy.sh"

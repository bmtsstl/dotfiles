#!/bin/sh
set -eu

DOTFILES="${HOME}/.dotfiles"
GIT_REPOSITORY='https://bmtsstl@github.com/bmtsstl/dotfiles.git'

if ! which git >/dev/null; then
	echo 'git is not installed or not in the $PATH' >&2
	exit 1
fi

git clone --recursive "${GIT_REPOSITORY}" "${DOTFILES}"
cd "${DOTFILES}"
git config user.name 'bmtsstl'
git config user.email '35141868+bmtsstl@users.noreply.github.com'

"${DOTFILES}/deploy.sh"

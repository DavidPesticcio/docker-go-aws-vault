#!/bin/bash

set -eo pipefail

set -x

export GOPATH="$HOME/go"
export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"

mkdir -p ${GOPATH}/src/github.com/99designs

cd ${GOPATH}/src/github.com/99designs

git clone git@github.com:99designs/aws-vault.git || ( cd aws-vault; git checkout master; git pull )

cd aws-vault

git remote add j0hnsmith git@github.com:j0hnsmith/aws-vault.git || true
git fetch j0hnsmith feature/add_yubikey
git checkout j0hnsmith/feature/add_yubikey

make build

ls -l /go

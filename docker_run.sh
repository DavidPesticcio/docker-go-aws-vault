#!/bin/bash

COMMAND="${1:-GPG_AGENT_INFO=\$HOME/S.gpg-agent gpg -K}"

echo ${COMMAND}

docker run --rm -ti \
           -v ~/.gnupg/S.gpg-agent:/root/S.gpg-agent \
           -v ~/.gnupg:/root/.gnupg \
           -v ${GOPATH}:/go \
           -- aws-vault:yubikey bash -c "${COMMAND}"

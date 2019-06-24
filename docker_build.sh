#!/bin/bash

IMAGE=aws-vault
TAG="${1:-yubikey}"

docker rmi $(docker images ${IMAGE} -q)
echo

docker build -t aws-vault:${TAG} .

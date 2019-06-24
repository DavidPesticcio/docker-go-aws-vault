FROM golang:alpine

ENV GOPATH=/user/go

# RUN apt-get update
# RUN apt-get -y install libpcsclite-dev

RUN apk --no-cache add \
        bash \
        g++ \
        gcc \
        git \
        gnupg \
        make \
        pcsc-lite-dev \
        openssh-client

COPY go_build.sh /user/go_build.sh

RUN addgroup -g 1000 user \
    && adduser -h /user -D -u 1000 -G user user \
    && chown -R user:user /user

WORKDIR /user

USER user

CMD go_build.sh

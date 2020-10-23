FROM alpine:latest

ENV version=6.4.0
RUN apk add --no-cache wget

WORKDIR /app
ADD config/doxmr.json ./
RUN wget -O doxmr.tar.gz https://github.com/xmrig/xmrig/releases/download/v$version/xmrig-$version-linux-static-x64.tar.gz && \
    tar xzvf doxmr.tar.gz -C /app

RUN ln -s ./xmrig-$version/xmrig ./doxmr
ENTRYPOINT ./doxmr -c ./doxmr.json
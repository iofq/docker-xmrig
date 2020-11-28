FROM alpine:latest

ENV VERSION=6.6.1
RUN apk add --no-cache curl

WORKDIR /root
ADD config/doxmr.json ./
RUN curl -sLO https://github.com/xmrig/xmrig/releases/download/v$VERSION/xmrig-$VERSION-linux-static-x64.tar.gz && \
    tar xzvf xmrig-$VERSION-linux-static-x64.tar.gz
WORKDIR xmrig-$VERSION
RUN sha256sum -c SHA256SUMS && \
  ln -s ./xmrig ./doxmr
    

ENTRYPOINT ./doxmr -c ./doxmr.json

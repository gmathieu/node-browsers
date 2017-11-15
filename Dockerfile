# https://hub.docker.com/r/library/node/tags/
FROM node:8-alpine

RUN \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk --no-cache  update \
  && apk add --no-cache \
    # browsers
    chromium firefox \
    # cci deps
    git openssh tar gzip ca-certificates \
    # deployment
    bash curl make \
  && rm -rf /var/cache/apk/* /tmp/*

ENV CHROME_BIN /usr/bin/chromium-browser
ENV FIREFOX_BIN /usr/bin/firefox

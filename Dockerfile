# https://hub.docker.com/r/library/node/tags/
FROM node:8-alpine

# https://pkgs.alpinelinux.org/packages?name=chromium
# https://pkgs.alpinelinux.org/packages?name=firefox-esr
ARG CHROMIUM=63.0.3239.108-r0
ARG FIREFOX=52.5.0-r0

RUN \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk --no-cache  update \
  && apk add --no-cache \
    # browsers
    chromium=${CHROMIUM} firefox-esr=${FIREFOX} \
    # GUI: Firefox ESR 52 has no -headless
    dbus xvfb \
    # cci deps
    git openssh tar gzip ca-certificates \
    # deployment
    bash curl make \
  && rm -rf /var/cache/apk/* /tmp/*

# GUI
ADD bin/xvfb-firefox /usr/bin/xvfb-firefox

ENV \
  CHROME_BIN=/usr/bin/chromium-browser \
  FIREFOX_BIN=/usr/bin/xvfb-firefox

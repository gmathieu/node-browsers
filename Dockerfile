# https://store.docker.com/images/node
FROM node:8-stretch

# https://packages.debian.org/stretch/chromium
# https://packages.debian.org/stretch/firefox-esr
ARG CHROMIUM=69.0.3497.92-1~deb9u1
ARG FIREFOX=60.2.0esr-1~deb9u2

# lock yarn version
ENV YARN_VERSION 1.9.4
RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz

RUN \
  apt-get update && apt-get install -y \
    # browsers
    chromium=${CHROMIUM} firefox-esr=${FIREFOX} \
    # cci deps
    git tar gzip ca-certificates \
    # deployment
    bash curl make \
  && rm -rf  /var/lib/apt/lists/* /tmp/*

ENV \
  # disable puppeteer download as it will not work with this image
  PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
  # browser bin paths
  CHROME_BIN=/usr/bin/chromium \
  FIREFOX_BIN=/usr/bin/firefox

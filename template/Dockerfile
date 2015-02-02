FROM gliderlabs/alpine:3.1

ADD ruby.tar.gz /usr/local/

RUN apk-install \
    readline \
    openssl \
    yaml \
    ca-certificates \
  && echo "gem: --no-document" > /root/.gemrc \
  && gem install bundler

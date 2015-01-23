FROM mini/base

ADD rubies/*.tar.gz /usr/local/

RUN apk-install readline \
  && echo "gem: --no-document" > /root/.gemrc \
  && gem install bundler

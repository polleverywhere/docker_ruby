FROM mini/base

RUN \
  curl -s -L https://github.com/sstephenson/ruby-build/archive/master.tar.gz \
  | tar mzxf - \
  && ruby-build-master/install.sh \
  && apk-install \
    bash \
    gcc \
    g++ \
    make \
    zlib-dev \
    readline-dev \
    openssl-dev \
    coreutils

ADD builder /usr/local/bin/builder

RUN echo "gem: --no-document" > /root/.gemrc \
  && chmod +x /usr/local/bin/builder

ENV RUBY_CONFIGURE_OPTS \
  --disable-install-doc \
  --with-static-linked-ext \
  --enable-load-relative
ENV RUBY_BUILD_CACHE_PATH \
  /tmp/rubycache
ENV TMPDIR \
  /tmp/rubybuild

VOLUME ["/usr/local/rubies", "/tmp/rubycache", "/tmp/rubybuild"]

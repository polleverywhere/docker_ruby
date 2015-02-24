FROM gliderlabs/alpine:3.1

RUN apk-install \
    bash \
    gcc \
    g++ \
    make \
    zlib-dev \
    readline-dev \
    openssl-dev \
    coreutils \
    curl \
  && curl -sL https://github.com/sstephenson/ruby-build/archive/master.tar.gz \
  | tar mzxf - \
  && ruby-build-master/install.sh

ADD builder /usr/local/bin/builder

RUN echo "gem: --no-document" > /root/.gemrc \
  && chmod +x /usr/local/bin/builder

ENV RUBY_CONFIGURE_OPTS \
  --disable-install-doc \
  --with-static-linked-ext \
  --enable-load-relative

VOLUME ["/usr/local/rubies"]

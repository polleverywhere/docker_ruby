FROM pepaul/ruby-build

RUN apt-get -q update \
  && DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
    autoconf \
    bison \
    build-essential \
    libffi-dev \
    zlib1g-dev \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    libncurses5-dev \
    libgdbm-dev \
  && apt-get -q -y clean \
  && rm -rf /var/lib/apt/lists

ADD builder /usr/local/bin/builder

RUN echo "gem: --no-document" > /root/.gemrc
RUN chmod +x /usr/local/bin/builder

ENV RUBY_CONFIGURE_OPTS \
  --disable-install-doc \
  --with-static-linked-ext \
  --enable-load-relative

VOLUME ["/usr/local/rubies", "/tmp"]

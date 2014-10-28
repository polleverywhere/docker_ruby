FROM polleverywhere/rbenv
MAINTAINER Andy Shinn <andy@polleverywhere.com>

ENV RUBY_VERSION 2.1.4

ADD .gemrc /root/.gemrc

RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
  autoconf wget bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g zlib1g-dev \
  && CONFIGURE_OPTS="--disable-install-doc" rbenv install $RUBY_VERSION \
  && rbenv global $RUBY_VERSION \
  && gem install --no-ri --no-rdoc bundler \
  && rbenv rehash \
  && apt-get purge -y -q wget autoconf bison build-essential libssl-dev zlib1g-dev \
  && apt-get autoremove -y \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

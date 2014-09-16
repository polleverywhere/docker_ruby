FROM polleverywhere/rbenv
MAINTAINER Andy Shinn <andy@polleverywhere.com>

ENV RUBY_VERSION 2.1.2

ADD .gemrc /root/.gemrc

RUN CONFIGURE_OPTS="--disable-install-doc" rbenv install $RUBY_VERSION \
  && rbenv global $RUBY_VERSION \
  && gem install --no-ri --no-rdoc bundler \
  && rbenv rehash

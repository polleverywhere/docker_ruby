FROM polleverywhere/rbenv
MAINTAINER Andy Shinn <andy@polleverywhere.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV PATH $HOME/.rbenv/shims:$PATH

RUN rbenv install 2.0.0-p481
RUN rbenv global 2.0.0-p481

RUN gem install --no-ri --no-rdoc bundler
RUN rbenv rehash

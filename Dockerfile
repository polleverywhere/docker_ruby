FROM polleverywhere/rbenv
MAINTAINER Andy Shinn <andy@polleverywhere.com>

RUN rbenv install 2.1.2
RUN rbenv global 2.1.2

RUN gem install --no-ri --no-rdoc bundler
RUN rbenv rehash

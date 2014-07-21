FROM polleverywhere/rbenv
MAINTAINER Andy Shinn <andy@polleverywhere.com>

ENV DEBIAN_FRONTEND noninteractive

RUN rbenv install 2.0.0-p451
RUN rbenv global 2.0.0-p451

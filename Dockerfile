FROM ubuntu-debootstrap:trusty

ADD rubies/*.tar.gz /usr/local/

RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
    libffi6 \
    ca-certificates \
    libgdbm3 \
    libyaml-0-2 \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists \
  && echo "gem: --no-document" > /root/.gemrc\
  && gem install bundler

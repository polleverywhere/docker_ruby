FROM ubuntu-debootstrap:trusty

RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
    libffi6 \
    ca-certificates \
    libgdbm3 \
    libyaml-0-2 \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists \
  && echo "gem: --no-document" > /root/.gemrc

ADD rubies/*.tar.gz /usr/local/

FROM docker-registry.ops.pe/centos:ruby-builder

RUN yum install -y \
    autoconf \
    bison \
    libffi-devel \
    zlib-devel \
    openssl-devel \
    libyaml-devel \
    readline-devel \
    ncurses-devel \
    gdbm-devel \
  && yum clean all

ADD builder /usr/local/bin/builder

RUN echo "gem: --no-document" > /root/.gemrc
RUN chmod +x /usr/local/bin/builder

ENV RUBY_CONFIGURE_OPTS \
  --disable-install-doc \
  --with-static-linked-ext \
  --enable-load-relative

VOLUME ["/usr/local/rubies", "/tmp"]

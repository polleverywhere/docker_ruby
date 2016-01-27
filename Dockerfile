FROM centos

ADD rubies/*.tar.gz /usr/local/

RUN yum install -y \
    libffi \
    ca-certificates \
    gdbm \
    libyaml \
  && yum clean all \
  && echo "gem: --no-document" > /root/.gemrc\
  && gem install bundler

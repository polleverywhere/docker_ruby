# Docker Ruby

[![CircleCI](https://img.shields.io/circleci/project/polleverywhere/docker_ruby.svg)](https://circleci.com/gh/polleverywhere/docker_ruby)

Docker images with Ruby and the `bundler` gem pre-installed. We can use this image in various Docker Ruby projects. A `Dockerfile` might look like:

```
FROM polleverywhere/ruby:2.1.2

RUN apt-get -q update \
  && apt-get -q -y install libmysqlclient-dev \
  && apt-get -q clean

ADD . /my_project

WORKDIR /my_project

RUN bundle install \
  --without development test

CMD /my_project/bin/thin -p $PORT start
```

## Build

We use a `Makefile` to build Ruby versions using a builder image. We then add these rubies to a `mini/base` image so we don't have all the build tools left around.

To build the images you can run:

```console
$ make build
```

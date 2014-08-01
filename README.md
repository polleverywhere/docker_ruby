# Docker Ruby

A Docker image with Ruby pre-installed through `rbenv`. It is based on https://github.com/polleverywhere/docker_rbenv. We can use this image in various Docker Ruby projects. A `Dockerfile` might look like:

```
FROM polleverywhere/ruby:2.1.2

ENV PORT 5000

RUN apt-get -q update
RUN apt-get -q -y install libmysqlclient-dev
RUN apt-get -q clean

ADD . /my_project
WORKDIR /my_project
RUN bundle install --binstubs --without development test

CMD /my_project/bin/thin -p $PORT start
```

docker_ruby
===========

Docker image with various Ruby versions installed in specific tags. This can be used in various Ruby Docker projects by specifying a specific tag in a Dockerfile:

```
FROM polleverywhere/ruby:2.0.0-p451
ADD . /my_project
CMD /my_project/bin/start
```

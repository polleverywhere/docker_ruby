FROM polleverywhere/rubyslim:2.1.2
RUN apk-install build-base libxml2-dev libxslt-dev sqlite-dev
COPY . /app
WORKDIR /app
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install \
  --jobs 4

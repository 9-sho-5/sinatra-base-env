FROM ruby:3.3.0

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev libssl-dev postgresql-client && \
  rm -rf /var/lib/apt/lists/*

RUN gem install bundler:2.5.22

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle _2.5.22_ install

COPY . /app

EXPOSE 4567

# CMD は docker-compose 側の command を使うため不要または以下のように rackup に統一
CMD ["bundle", "exec", "rackup", "-p", "4567", "-o", "0.0.0.0", "config/config.ru"]

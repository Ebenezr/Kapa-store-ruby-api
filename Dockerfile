FROM ruby:2.7.4-alpine3.15

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /app

COPY Gemfile* /app/

RUN gem install bundler

RUN bundle check || bundle install

COPY . ./

CMD ['rails' ,'server']


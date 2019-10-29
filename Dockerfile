FROM ruby:2.5.1-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /rails-events
WORKDIR /rails-events

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Basil Mawejje <basil.mawejje@gmail.com>"

CMD puma -C config/puma.rb
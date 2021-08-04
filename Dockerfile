FROM ruby:2.7.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /rails-events
ENV BUNDLER_VERSION=2.2.24
RUN gem install bundler:2.2.24
COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
COPY . .
LABEL maintainer="Basil Mawejje <basil.mawejje@gmail.com>"
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
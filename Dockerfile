FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /app

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . /app

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

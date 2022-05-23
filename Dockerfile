FROM ruby:3.0

RUN apt-get update && apt-get install -y --no-install-recommends lm-sensors

ENV APP_HOME /app
ENV BUNDLE_PATH /gems
RUN mkdir $APP_HOME
VOLUME $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* ./
RUN bundle install

EXPOSE 3001

CMD bundle exec puma -C puma.rb --port=3001 --binding=0.0.0.0

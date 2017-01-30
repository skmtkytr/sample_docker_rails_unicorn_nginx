FROM ruby:2.3.3

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get install -y nodejs \
                       mysql-client \
                       postgresql-client \
                       sqlite3 \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  bundle install && \
  rm -rf ~/.gem /usr/src/app/tmp/pids/unicorn.pid

#  rake db:create && \
#  rake db:migrate && \
COPY . $APP_ROOT

#ONBUILD RUN bundle exec rake db:create RAILS_ENV=production
#ONBUILD RUN bundle exec rake db:migrate RAILS_ENV=production

EXPOSE  8080

CMD ["bundle", "exec", "rake", "db:create", "RAILS_ENV=development"]
CMD ["bundle", "exec", "rake", "db:migrate", "RAILS_ENV=development"]
#CMD ["bundle", "exec", "rails", "s"]
CMD ["bundle", "exec", "unicorn_rails", "-c", "config/unicorn.rb", "-E", "development"]
#CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0","-e","development"]

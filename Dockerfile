FROM assemblyline/ruby:2.1.5

ENV GIT_SSH /rubydoc/config/git_ssh

COPY Gemfile /rubydoc/Gemfile
COPY Gemfile.lock /rubydoc/Gemfile.lock

WORKDIR /rubydoc

RUN bundle install --deployment --without="development,test"

COPY . /rubydoc
COPY config/known_hosts /home/root/.ssh/known_hosts

RUN mkdir -p tmp/pids \
      && mkdir data \
      && mkdir repos

CMD bundle exec puma -C config/puma.rb

EXPOSE 8080

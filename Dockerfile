FROM assemblyline/ruby:2.1.5

ENV GIT_SSH /rubydoc/config/git_ssh

COPY Gemfile /rubydoc/Gemfile
COPY Gemfile.lock /rubydoc/Gemfile.lock

WORKDIR /rubydoc

RUN bundle install --deployment --without="development,test"

COPY . /rubydoc
COPY config/known_hosts /home/conan/.ssh/known_hosts

RUN mkdir -p tmp/pids \
      && mkdir data \
      && mkdir repos \
      && useradd conan \
      && chown -R conan /rubydoc \
      && chown -R conan /home/conan

USER conan

CMD bundle exec puma

EXPOSE 8080

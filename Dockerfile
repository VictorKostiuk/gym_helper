ARG RUBY_VERSION=3.1.2
FROM ruby:$RUBY_VERSION

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -

# Install libvips for Active Storage preview support
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50 && \
    apt-get update -qq && \
    apt-get upgrade --yes --force-yes && \
    apt-get --yes --force-yes install libgmp-dev git git-core build-essential sqlite3 \
    libssl-dev libreadline-dev libyaml-dev libsqlite3-dev libxml2-dev \
    libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev zlib1g-dev
ENV NODE_VERSION=16.13.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# nvm environment variables
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
# Rails app lives here

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN #node -v
RUN #npm -v

WORKDIR /rails
# Set production environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT=" development"
# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install
# Copy application code
COPY . .
# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/
# Precompiling assets for production without requiring secret RAILS_MASTER KEY
RUN SECRET_KEY_BASE=2a0ec1f9bc0ac2406be4951160454dc853347132af6b2bb72b340ebbabb369de5ef0f4044643fb14472100fb95679d7844cdc6a7078e48f176f65942c9052c19 bundle exec rails assets:precompile

CMD ["chmod", "a+rwx", "bin/docker-entrypoint.sh"]
ENTRYPOINT ["./bin/docker-entrypoint.sh"]

EXPOSE 3000
CMD ["./bin/rails", "server"]
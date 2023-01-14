ARG RUBY_VERSION=3.1.2
FROM ruby:$RUBY_VERSION

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -

# Install libvips for Active Storage preview support
RUN apt-get update -qq && \
    apt-get install -y build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man


RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.19.0

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
# Rails app lives here

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN node -v
RUN npm -v

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
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["/bin/rails", "server"]
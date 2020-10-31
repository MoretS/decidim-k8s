FROM ruby:2.5.3

ENV BUNDLER_VERSION=2.1.4

RUN apt-get install -y \
    git imagemagick wget autoconf \
    libssl-dev libyaml-dev libreadline-dev \
    zlib1g-dev libncurses5-dev libffi-dev libgdbm3 \
    libicu-dev \
  && apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean

RUN npm install -g npm@6.3.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install yarn

RUN gem install bundler -v 2.1.4

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY package.json ./

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

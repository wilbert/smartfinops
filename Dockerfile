FROM ruby:3.0.0-alpine

ENV BUNDLER_VERSION=2.2.3

RUN apk add --update --no-cache \
      binutils-gold \
      bash \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      npm \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      imagemagick \
      imagemagick-c++ \
      imagemagick-dev \
      imagemagick-libs \
      python3 \
      py3-pip

RUN gem install bundler -v 2.2.3
RUN npm install --global yarn

WORKDIR /usr/src/app

ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    GEM_HOME=/usr/local/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"
ENV PATH=./bin:$PATH

COPY Gemfile* ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . .

EXPOSE 3000

#COPY ./docker-entrypoint.sh /
#RUN chmod +x /docker-entrypoint.sh
#ENTRYPOINT ["/docker-entrypoint.sh"]

#CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

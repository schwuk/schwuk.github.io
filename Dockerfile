FROM docker.io/ruby:2.7.3-alpine

RUN apk update && apk add --no-cache git

RUN apk update && apk add --no-cache --virtual .build_deps make build-base libxml2-dev

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

WORKDIR /src/site

CMD ["jekyll", "serve", "-H", "0.0.0.0", "-P", "4000"]

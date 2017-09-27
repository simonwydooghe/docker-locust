FROM alpine:3.6
MAINTAINER Simon Wydooghe <simon@wydooghe.com>

ARG VERSION=0.8.1

RUN apk --no-cache add python2 py-setuptools py2-zmq
RUN apk --no-cache add --virtual build-dependencies build-base python2-dev py2-pip \
  && pip install locustio==$VERSION \
  && apk del build-dependencies

ENTRYPOINT ["locust"]

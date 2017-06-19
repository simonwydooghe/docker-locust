FROM alpine:3.5
MAINTAINER Simon Wydooghe <simon@wydooghe.com>

RUN apk --no-cache add python2 py-setuptools py2-zmq
RUN apk --no-cache add --virtual build-dependencies build-base python2-dev py2-pip \
  && pip install locustio==0.7.5 \
  && apk del build-dependencies

VOLUME /locust
WORKDIR /locust

EXPOSE 8089

CMD ["locust"]

FROM python:2.7.13-alpine

RUN apk --no-cache add --virtual build-dependencies build-base \
  && pip install pyzmq locustio \
  && apk del build-dependencies

RUN mkdir /locust
WORKDIR /locust
VOLUME /locust

EXPOSE 8089

ENTRYPOINT ["locust"]

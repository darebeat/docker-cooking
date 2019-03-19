FROM alpine:latest
MAINTAINER Darebeat <fengwei2010@126.com>

ADD ./src /
WORKDIR /opt

RUN apk add --update mysql mysql-client; rm -f /var/cache/apk/*

EXPOSE 3306
CMD ["/startup.sh"]

FROM alpine

MAINTAINER darebeat <darebeat@126.com>

ENV AZK_VERSION 3.57.0
ENV MYSQL_JDBC_VERSION 5.1.47

RUN apk add --update openjdk8-jre curl bash mysql-client && \
    curl -sLk https://raw.githubusercontent.com/parisgo/docker-azkaban/master/azkaban-webserver/azkaban-web-server-${AZK_VERSION}.tar.gz | tar xz && \
    curl -sLk http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_JDBC_VERSION}.tar.gz | tar xz && \
    mv mysql-connector-java-${MYSQL_JDBC_VERSION}/mysql-connector-java-${MYSQL_JDBC_VERSION}-bin.jar azkaban-web-server-${AZK_VERSION}/lib/ && \
    mkdir azkaban-web-server-${AZK_VERSION}/logs/ && \
    rm -rf mysql-connector-java-${MYSQL_JDBC_VERSION}* && \
    rm -rf azkaban-web-server-${AZK_VERSION}.tar.gz && \
    rm -rf /var/cache/apk/* && \
    sed -i "s/&//" azkaban-web-server-${AZK_VERSION}/bin/start-web.sh

COPY src azkaban-web-server-${AZK_VERSION}

# Azkaban web server port
EXPOSE 8443

# Define default workdir
WORKDIR /azkaban-web-server-${AZK_VERSION}

CMD ["./run.sh"]

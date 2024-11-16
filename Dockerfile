# スキーマSpy用のビルドステージ
FROM openjdk:8u212-jdk-alpine as schemaspy-builder
ENV APP_URL https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar
WORKDIR /
RUN apk --update add graphviz ttf-dejavu && \
    apk --update add --virtual .builddep tzdata wget libressl && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    wget -O schemaspy.jar ${APP_URL} && \
    apk del .builddep && \
    rm -rf /var/cache/apk/*

COPY schemaspy.properties /schemaspy.properties
COPY drivers/postgresql-42.7.4.jar /drivers/postgresql.jar

RUN apk add --no-cache git bash
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
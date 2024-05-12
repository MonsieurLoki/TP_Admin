FROM mysql
COPY custom.cnf /etc/mysql/conf.d/custom.cnf

# RUN apk update && apk add nano net-tools iputils-ping curl iproute2 htop vim bash

ENV MYSQL_DATABASE=woody

COPY ./sql-scripts/ /docker-entrypoint-initdb.d/

FROM nginx:alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN apk update && apk add nano net-tools iputils-ping curl iproute2 htop vim bash

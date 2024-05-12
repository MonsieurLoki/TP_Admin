FROM nginx:1.25.4

COPY ./index.html /usr/share/nginx/html/
COPY ./5mo.jpg /usr/share/nginx/html/

RUN apt update
RUN apt install -y nano net-tools iputils-ping curl iproute2 htop vim bash

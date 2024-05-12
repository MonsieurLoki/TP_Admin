FROM python:3.12.3-bookworm
#FROM python:3.12-alpine

RUN apt update
RUN apt install -y nano net-tools iputils-ping curl iproute2 htop vim

RUN pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /project

# Create a group and user and set it
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#RUN chown appuser /project
#USER appuser



COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir

COPY . .

ENV test=v3.5

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

CMD [ "python", "main.py" ]

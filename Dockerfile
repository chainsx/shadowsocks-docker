FROM ubuntu:jammy

MAINTAINER guolin <guo.lin@outlook.com>

RUN apt-get update && \
    apt-get install -y --force-yes -m python3-pip python3-m2crypto &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install shadowsocks --break-system-packages

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 20088
ENV SS_PASSWORD 28465790
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["bash", "-c", "/start.sh"]

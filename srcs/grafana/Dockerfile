FROM alpine:3.12

RUN apk update && apk upgrade
RUN	apk	add supervisor vim

WORKDIR /tmp

RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk && \
    apk add glibc-2.33-r0.apk

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.1.linux-amd64.tar.gz && \
    tar -xf grafana-7.3.1.linux-amd64.tar.gz && \
    mv grafana-7.3.1 /etc/grafana

COPY grafana.db /etc/grafana/data/
COPY setup.sh .
RUN chmod +x setup.sh

WORKDIR /etc/grafana 

ENTRYPOINT ["/tmp/setup.sh"]

FROM alpine:3.12

RUN apk update && apk upgrade
RUN	apk	add supervisor vim

RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk && \
    apk add glibc-2.33-r0.apk

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz && \
    tar -xf telegraf-1.16.1_linux_amd64.tar.gz && \
    cp -r /telegraf-1.16.1/* .

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz && \
    tar -xf influxdb-1.8.3-static_linux_amd64.tar.gz && \
    mv influxdb-1.8.3-1 /etc/influxdb

RUN /usr/bin/telegraf -sample-config --input-filter docker \
	--output-filter influxdb > /etc/telegraf/telegraf.conf

COPY ./supervisord.conf /etc/supervisord.conf
COPY setup.sh .
RUN chmod +x setup.sh

ENTRYPOINT ["./setup.sh"]

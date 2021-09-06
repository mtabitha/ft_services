FROM alpine:3.12

RUN apk update && apk upgrade
RUN	apk add nginx openssl openssh supervisor vim

WORKDIR /tmp

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=RU/ST=RT/L=Kazan/O=21kazan/OU=mtabitha/CN=localhost" -newkey rsa:2048 \
	-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/

COPY ./supervisord.conf /etc/
COPY ./setup.sh .

RUN chmod +x setup.sh

ENTRYPOINT [ "./setup.sh" ]

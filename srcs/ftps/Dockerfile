FROM alpine:3.12

RUN apk update && apk upgrade && \
	apk add vsftpd vim openssl

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=RU/ST=RT/L=Kazan/O=21kazan/OU=mtabitha/CN=localhost" -newkey rsa:2048 \
	-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

RUN echo "root:1234" | chpasswd

COPY vsftpd.conf /etc/vsftpd/
COPY ./setup.sh .

RUN chmod +x setup.sh

ENTRYPOINT ["/setup.sh"] 

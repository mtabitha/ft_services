FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-iconv \
	php7-curl php7-json php7-session php7-xml php7-mbstring php7-phar\
	vim nginx supervisor

WORKDIR /tmp

RUN wget  https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz && \
	tar -xf phpMyAdmin-5.1.0-english.tar.gz && \
	mv phpMyAdmin-5.1.0-english /var/www/

RUN mkdir -p /run/nginx 
COPY nginx.conf /etc/nginx/

COPY config.inc.php /var/www/phpMyAdmin-5.1.0-english/
COPY supervisord.conf /etc/
COPY ./setup.sh .
RUN chmod +x setup.sh

ENTRYPOINT ["./setup.sh"]

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-iconv \
	php7-curl  php7-json php7-session php7-xml \
	vim nginx supervisor php7-ctype

WORKDIR /tmp

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xf latest.tar.gz && \
	mv wordpress /var/www/

RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/

COPY wp-config.php /var/www/wordpress/
COPY supervisord.conf /etc/
COPY ./setup.sh .
RUN chmod +x setup.sh

ENTRYPOINT [ "./setup.sh" ]

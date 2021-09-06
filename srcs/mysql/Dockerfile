FROM alpine:3.12

RUN apk update && apk upgrade && \
	apk add mariadb mariadb-common mariadb-client \
	openrc vim 

WORKDIR /tmp

COPY ./setup.sh ./init_mysql.sql ./wordpress.sql ./
COPY my.cnf /etc/mysql/

RUN chmod +x setup.sh

ENTRYPOINT [ "./setup.sh" ] 

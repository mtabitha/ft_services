#!/bin/sh

minikube start --vm-driver=virtualbox
minikube addons enable metallb

eval $(minikube docker-env)
docker pull alpine:3.12

cd ./srcs

docker build -t mysql_img mysql/.
docker build -t wordpress_img wordpress/.
docker build -t phpmyadmin_img phpmyadmin/.
docker build -t nginx_img nginx/.
docker build -t ftps_img ftps/.
docker build -t influxdb_img influxdb/.
docker build -t grafana_img grafana/.

kubectl apply -f metallb.yaml

kubectl apply -f mysql/mysql.yaml
kubectl apply -f wordpress/wordpress.yaml
kubectl apply -f phpmyadmin/phpmyadmin.yaml
kubectl apply -f nginx/nginx.yaml
kubectl apply -f ftps/ftps.yaml
kubectl apply -f influxdb/influxdb.yaml
kubectl apply -f grafana/grafana.yaml

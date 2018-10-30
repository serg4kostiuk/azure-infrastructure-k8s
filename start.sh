#!/bin/bash

terraform apply -auto-approve 

#clear config file
truncate -s 0 /home/serg/.kube/config
az aks get-credentials --resource-group myrg --name myk8s

#create nodes
kubectl apply -f yml/my-namespace.yml
kubectl apply -f yml/php-apache.yml
kubectl apply -f yml/mysql.yml
#/bin/bash scripts/create-prometheus.sh
#kubectl create -f /yml/monitor.yml

#get info
kubectl get svc,rc,pods -o wide,nods -o wide
kubectl pods --output=wide
kubectl nods --output=wide


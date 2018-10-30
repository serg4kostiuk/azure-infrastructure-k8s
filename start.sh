#!/bin/bash

terraform apply -auto-approve 

#clear config file
truncate -s 0 /home/serg/.kube/config
az aks get-credentials --resource-group myrg --name myk8s
alias k='kubectl'
alias kget='kubectl get --all-namespaces'

echo "Deploying namespace"
kubectl apply -f yml/my-namespace.yml

echo "Deploying mysql"
kubectl apply -f yml/mysql.yml

echo "Deploying PHP and Apache web server"
kubectl apply -f yml/php-apache.yml

echo "Get info about deployments"
watch kubectl get svc,rc,pods -o wide,nods -o wide

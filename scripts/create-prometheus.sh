#!/bin/bash

#create prometheus deployment
kubectl create configmap prometheus-cm --from-file=/home/serg/Documents/prometheus/yml/prometheus.yml -o yaml --dry-run | kubectl apply -f - 
kubectl create -f /home/serg/Documents/prometheus/yml/monitor.yml
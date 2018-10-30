#!/bin/bash

helm list
helm delete $(helm list)
kubectl get all --namespace kube-system
kubectl delete --namespace kube-system svc tiller-deploy
kubectl delete --namespace kube-system deploy tiller-deploy
helm reset --force
helm list
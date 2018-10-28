#!/bin/bash

#clear prometheus deployment
kubectl delete deployment prometheus-deployment
kubectl delete service prometheus-example-service
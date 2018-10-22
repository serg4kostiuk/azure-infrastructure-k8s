terraform apply -auto-approve

#clear config file
truncate -s 0 /home/serg/.kube/config
az aks get-credentials --resource-group myrg --name myk8s

kubectl apply -f php-apache.yml
kubectl apply -f mysql.yml

kubectl get pods,svc,rc
kubectl pods --output=wide
kubectl nods --output=wide


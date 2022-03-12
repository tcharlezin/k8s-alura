#!/bin/bash

# Create ConfigMap
kubectl apply -f db-configmap.yaml
kubectl apply -f portal-configmap.yaml
kubectl apply -f sistema-configmap.yaml

# Pods Individually (But they are normally created inside Deployments)
# kubectl apply -f db-noticias.yaml
# kubectl apply -f portal-noticias.yaml
# kubectl apply -f sistema-noticias.yaml

# Services
kubectl apply -f svc-db-noticias.yaml
kubectl apply -f svc-portal-noticias.yaml
kubectl apply -f svc-sistema-noticias.yaml

# ReplicaSet (Normally replica sets are inside a deployment)
# kubectl apply -f portal-noticias-replicaset.yaml

# Deployment (Example of NGINX)
# kubectl apply -f nginx-deployment.yaml -- record # Can use CHANGE CAUSE to annotate


###########################################
### Commands and comments  [day-to-day]
###########################################

# INTERNAL-IP:           kubectl get nodes -O wide

# WATCH:                 kubectl get [pod, svc, rs] --watch

# DEPLOYMENT REVISIONS:  kubectl rollout history deployment nginx-deployment
# CHANGE CAUSE:          kubectl annotate deployment nginx-deployment kubernetes.io/change-cause="Definindo a imagem com versão latest"
# ROLLOUT UNDO:          kubectl rollout undo deployment nginx-deployment --to-revision=3

# DEPLOYMENT HISTORY:    kubectl rollout history deployment portal-noticias-deployment


###########################################
### Checking and creating annotates
###########################################
# kubectl rollout history deployment portal-noticias-deployment
# kubectl annotate deployment portal-noticias-deployment kubernetes.io/change-cause="Definindo a imagem com versão 1"

# kubectl rollout history deployment sistema-noticias-deployment
# kubectl annotate deployment sistema-noticias-deployment kubernetes.io/change-cause="Definindo a imagem com versão 1"

# kubectl rollout history deployment db-noticias-deployment
# kubectl annotate deployment db-noticias-deployment kubernetes.io/change-cause="Definindo a imagem com versão 1"


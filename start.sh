#!/bin/bash

# ConfigMap
kubectl apply -f db-configmap.yaml
kubectl apply -f portal-configmap.yaml
kubectl apply -f sistema-configmap.yaml

# Pods
kubectl apply -f db-noticias.yaml
# This pod will be covered by ReplicaSet
# kubectl apply -f portal-noticias.yaml
kubectl apply -f sistema-noticias.yaml

# Services
kubectl apply -f svc-db-noticias.yaml
kubectl apply -f svc-portal-noticias.yaml
kubectl apply -f svc-sistema-noticias.yaml

# ReplicaSet
kubectl apply -f portal-noticias-replicaset.yaml

# Deployment
kubectl apply -f nginx-deployment.yaml -- record # Can use CHANGE CAUSE to annotate

# INTERNAL-IP:           kubectl get nodes -O wide

# WATCH:                 kubectl get [pod, svc, rs] --watch

# DEPLOYMENT REVISIONS:  kubectl rollout history deployment nginx-deployment
# CHANGE CAUSE:          kubectl annotate deployment nginx-deployment kubernetes.io/change-cause="Definindo a imagem com versão latest"
# ROLLOUT UNDO:          kubectl rollout undo deployment nginx-deployment --to-revision=3

# ROLLOUT HISTORY:       kubectl rollout history deployment portal-noticias-deployment

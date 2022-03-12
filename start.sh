#!/bin/bash

# Create ConfigMap
kubectl apply -f db-configmap.yaml
kubectl apply -f portal-configmap.yaml
kubectl apply -f sistema-configmap.yaml

# Services
kubectl apply -f svc-db-noticias.yaml
kubectl apply -f svc-portal-noticias.yaml
kubectl apply -f svc-sistema-noticias.yaml

# Deployment (Example of NGINX)
kubectl apply -f db-noticias-deployment.yaml
kubectl apply -f portal-noticias-deployment.yaml
kubectl apply -f sistema-noticias-deployment.yaml


# kubectl rollout history deployment portal-noticias-deployment
kubectl annotate deployment portal-noticias-deployment kubernetes.io/change-cause="Definindo o portal com versão 1"

# kubectl rollout history deployment sistema-noticias-deployment
kubectl annotate deployment sistema-noticias-deployment kubernetes.io/change-cause="Definindo o sistema com versão 1"

# kubectl rollout history deployment db-noticias-deployment
kubectl annotate deployment db-noticias-deployment kubernetes.io/change-cause="Definindo o db com versão 1"
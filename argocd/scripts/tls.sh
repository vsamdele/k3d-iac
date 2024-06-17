#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

DOMAIN="vsamdele.space"

echo -e "${GREEN}Creating TLS for Argo CD...${NC}"

openssl genrsa -out "tls/ca.key" 2048
openssl req -new -x509 -days 365 -key "tls/ca.key" -out "tls/ca.crt" \
    -subj "/C=RU/ST=Noname/L=Noname/O=VSD/CN=argocd.$DOMAIN"
openssl genrsa -out "tls/domain.key" 2048
openssl req -new -key "tls/domain.key" -out "tls/domain.csr" \
    -subj "/C=RU/ST=Noname/L=Noname/O=VSD/OU=infra/CN=argocd.$DOMAIN"
openssl x509 -req -extfile <(printf "subjectAltName=DNS:argocd.$DOMAIN,DNS:www.argocd.$DOMAIN") \
    -days 365 -in "tls/domain.csr" -CA "tls/ca.crt" \
    -CAkey "tls/ca.key" -set_serial 01 -out "tls/domain.crt"
cat "tls/domain.crt" "tls/domain.key" > "tls/domain.pem"

kubectl get namespace argocd || kubectl create namespace argocd
kubectl create secret tls argocd-server-tls --cert="tls/domain.crt" --key="tls/domain.key" -n argocd

echo -e "${GREEN}Creating TLS for Argo CD done!${NC}"
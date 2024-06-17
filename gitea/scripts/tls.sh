#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

DOMAIN="vsamdele.space"

echo -e "${GREEN}Creating TLS for Gitea...${NC}"

openssl genrsa -out "tls/ca.key" 2048
openssl req -new -x509 -days 365 -key "tls/ca.key" -out "tls/ca.crt" \
    -subj "/C=RU/ST=Noname/L=Noname/O=VSD/CN=gitea.$DOMAIN"
openssl genrsa -out "tls/domain.key" 2048
openssl req -new -key "tls/domain.key" -out "tls/domain.csr" \
    -subj "/C=RU/ST=Noname/L=Noname/O=VSD/OU=infra/CN=gitea.$DOMAIN"
openssl x509 -req -extfile <(printf "subjectAltName=DNS:gitea.$DOMAIN,DNS:www.gitea.$DOMAIN") \
    -days 365 -in "tls/domain.csr" -CA "tls/ca.crt" \
    -CAkey "tls/ca.key" -set_serial 01 -out "tls/domain.crt"
cat "tls/domain.crt" "tls/domain.key" > "tls/domain.pem"

kubectl get namespace gitea || kubectl create namespace gitea
kubectl create secret tls gitea-tls --cert="tls/domain.crt" --key="tls/domain.key" -n gitea
kubectl create secret generic gitea-ca-cert --from-file=ca.crt=tls/ca.crt -n gitea

echo -e "${GREEN}Creating TLS for Gitea done!${NC}"
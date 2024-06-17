#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

DOMAIN="vsamdele.space"

echo -e "${GREEN}Creating TLS for Drone CI...${NC}"

openssl genrsa -out "tls/ca.key" 2048
openssl req -new -x509 -days 365 -key "tls/ca.key" -out "tls/ca.crt" \
    -subj "/C=RU/ST=Noname/L=Noname/O=VSD/CN=drone.$DOMAIN"
openssl genrsa -out "tls/domain.key" 2048
openssl req -new -key "tls/domain.key" -out "tls/domain.csr" \
    -subj "/C=RU/ST=Noname/L=Noname/O=VSD/OU=infra/CN=drone.$DOMAIN"
openssl x509 -req -extfile <(printf "subjectAltName=DNS:drone.$DOMAIN,DNS:www.drone.$DOMAIN") \
    -days 365 -in "tls/domain.csr" -CA "tls/ca.crt" \
    -CAkey "tls/ca.key" -set_serial 01 -out "tls/domain.crt"
cat "tls/domain.crt" "tls/domain.key" > "tls/domain.pem"

kubectl create namespace drone
kubectl create secret tls drone-tls --cert="tls/domain.crt" --key="tls/domain.key" -n drone

echo -e "${GREEN}Creating TLS for Drone CI done!${NC}"

echo -e "${GREEN}Creating combined (drone+gitea) CA certificates...${NC}"

kubectl get secret gitea-ca-cert -o jsonpath="{.data['ca\.crt']}" -n gitea | base64 --decode > tls/gitea-ca.crt
kubectl create secret generic gitea-ca-cert --from-file=ca.crt=tls/gitea-ca.crt -n drone

cat "tls/ca.crt" "tls/gitea-ca.crt" > "tls/drone-gitea-ca-cert.crt"
kubectl create secret generic drone-gitea-ca-cert --from-file=ca.crt=tls/drone-gitea-ca-cert.crt -n drone

echo -e "${GREEN}Creating combined (drone+gitea) CA certificates done!${NC}"

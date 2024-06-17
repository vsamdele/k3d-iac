#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Argo CD...${NC}"

helm install argocd helm --create-namespace --namespace argocd

echo -e "${GREEN}Installing Argo CD done!${NC}"
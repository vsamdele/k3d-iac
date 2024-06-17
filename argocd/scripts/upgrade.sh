#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Upgrading Argo CD...${NC}"

helm upgrade argocd helm --create-namespace --namespace argocd

echo -e "${GREEN}Upgrading Argo CD done!${NC}"
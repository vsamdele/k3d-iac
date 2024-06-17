#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Cleaning ArgoCD...${NC}"

kubectl delete namespace argocd

echo -e "${GREEN}Cleaning ArgoCD done!${NC}"
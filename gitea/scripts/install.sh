#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Gitea...${NC}"

helm install gitea helm --create-namespace --namespace gitea

echo -e "${GREEN}Installing Gitea done!${NC}"
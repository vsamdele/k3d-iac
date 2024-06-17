#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Upgrading Gitea...${NC}"

helm upgrade gitea helm --create-namespace --namespace gitea

echo -e "${GREEN}Upgrading Gitea done!${NC}"
#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Cleaning Gitea...${NC}"

kubectl delete namespace gitea

echo -e "${GREEN}Cleaning Gitea done!${NC}"
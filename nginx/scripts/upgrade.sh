#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Upgrading Nginx...${NC}"

helm upgrade nginx helm --create-namespace --namespace nginx

echo -e "${GREEN}Upgrading Nginx done!${NC}"
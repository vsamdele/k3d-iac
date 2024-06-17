#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Nginx...${NC}"

helm install nginx helm --create-namespace --namespace nginx

echo -e "${GREEN}Installing Nginx done!${NC}"
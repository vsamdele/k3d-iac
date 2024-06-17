#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Cleaning Nginx...${NC}"

kubectl delete namespace nginx

echo -e "${GREEN}Cleaning Nginx done!${NC}"
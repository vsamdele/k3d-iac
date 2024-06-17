#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Cleaning Prometheus...${NC}"

kubectl delete namespace prometheus

echo -e "${GREEN}Cleaning Prometheus done!${NC}"
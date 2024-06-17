#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Prometheus...${NC}"

helm install prometheus helm --create-namespace --namespace prometheus

echo -e "${GREEN}Installing Prometheus done!${NC}"
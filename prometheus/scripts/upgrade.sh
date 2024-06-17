#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Upgrading Prometheus...${NC}"

helm upgrade prometheus helm --create-namespace --namespace prometheus

echo -e "${GREEN}Upgrading Prometheus done!${NC}"
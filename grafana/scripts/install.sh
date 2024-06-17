#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Grafana...${NC}"

helm install grafana helm --create-namespace --namespace grafana

echo -e "${GREEN}Installing Grafana done!${NC}"
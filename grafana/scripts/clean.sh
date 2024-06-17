#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Cleaning Grafana...${NC}"

kubectl delete namespace grafana

echo -e "${GREEN}Cleaning Grafana done!${NC}"
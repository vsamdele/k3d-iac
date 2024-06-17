#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Updating dependencies...${NC}"

helm dependency update helm

echo -e "${GREEN}Updating dependencies done!${NC}"
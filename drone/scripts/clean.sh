#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Cleaning Drone CI...${NC}"

kubectl delete namespace drone

echo -e "${GREEN}Cleaning Drone CI done!${NC}"
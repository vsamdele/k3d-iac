#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Drone CI...${NC}"

helm install drone helm --create-namespace --namespace drone

echo -e "${GREEN}Installing Drone CI done!${NC}"
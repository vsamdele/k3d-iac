#!/bin/bash

set -e
set -u
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'

KUBECTL_VERSION=v1.30.2

echo -e "${GREEN}Your OS: $OSTYPE${NC}"

echo -e "${GREEN}1. Install k3d${NC}"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d version
echo -e "${GREEN}Install k3d done!${NC}"

echo -e "${GREEN}2. Install kubectl${NC}"
if [[ "$OSTYPE" == "darwin"* ]]; then
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/darwin/amd64/kubectl"
    chmod +x ./kubectl
    mv kubectl /usr/local/bin/kubectl
else
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl"
    install kubectl /usr/local/bin/kubectl
fi
kubectl version --client
echo -e "${GREEN}Install kubectl done!${NC}"

echo -e "${GREEN}3. Install Helm${NC}"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh
helm version
echo -e "${GREEN}Install Helm done!${NC}"

echo -e "${GREEN}All done!${NC}"

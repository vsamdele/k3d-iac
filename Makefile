# Makefile for iac-k3d-cluster
.PHONY: help install up

# Default target
.DEFAULT_GOAL := help

K3D_CONFIG := config.yaml
CERTS_DIR=certs

help: ## Display this help
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

install: ## Install tools
	chmod +x scripts/install.sh
	SUDO_USER=$(shell whoami) ./scripts/install.sh

up: ## Start k3d cluster
	@k3d cluster create vsamdele --config $(K3D_CONFIG)
	cd nginx && $(MAKE) install
	cd prometheus && $(MAKE) install
	cd grafana && $(MAKE) install

down: ## Down k3d cluster
	@k3d cluster delete --config $(K3D_CONFIG)

restart: ## Restart k3d cluster
	@$(MAKE) down
	@$(MAKE) up

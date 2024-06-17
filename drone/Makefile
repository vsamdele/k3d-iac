# Makefile for iac-k3d-cluster
.PHONY: help install upgrade deps tls clean

# Default target
.DEFAULT_GOAL := help

tls: ## Generate TLS
	./scripts/tls.sh

install: ## Install Drone CI
	./scripts/tls.sh
	./scripts/install.sh

deps: ## Install dependencies
	./scripts/deps.sh

upgrade: ## Upgrade Drone CI
	./scripts/upgrade.sh

clean: ## Clean Drone CI
	./scripts/clean.sh

help: ## Display this help
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

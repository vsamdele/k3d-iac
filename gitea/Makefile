# Makefile for iac-k3d-cluster
.PHONY: help install upgrade deps tls clean

# Default target
.DEFAULT_GOAL := help

help: ## Display this help
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

tls: ## Generate TLS
	./scripts/tls.sh

install: ## Install Gitea
	./scripts/tls.sh
	./scripts/install.sh

deps: ## Install dependencies
	./scripts/deps.sh

upgrade: ## Upgrade Gitea
	./scripts/upgrade.sh

clean: ## Clean Gitea
	./scripts/clean.sh

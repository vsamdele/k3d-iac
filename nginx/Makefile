# Makefile for iac-k3d-cluster
.PHONY: help install upgrade

# Default target
.DEFAULT_GOAL := help

help: ## Display this help
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

install: ## Install Nginx
	./scripts/install.sh

deps: ## Install dependencies
	./scripts/deps.sh

upgrade: ## Upgrade Nginx
	./scripts/upgrade.sh

clean: ## Clean Nginx
	./scripts/clean.sh

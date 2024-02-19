# Makefile for managing Docker operations for DSpace

# Default action to show help
all: help

# Pull latest images from Docker Hub
pull:
	docker-compose -f docker-compose.yml -f docker-compose-cli.yml pull

# Build images from the current branch
build:
	docker-compose -f docker-compose.yml -f docker-compose-cli.yml build

# Build images with a specific JDK version
build-jdk:
	docker-compose -f docker-compose.yml -f docker-compose-cli.yml build --build-arg JDK_VERSION=17

# Start DSpace 7 REST API
up:
	docker-compose -p d7 up -d

down:
	docker-compose -p d7 down

ls:
	docker-compose ls
	
# Start DSpace 7 REST API and Angular UI
up-ui:
	docker-compose -p d7 -f docker-compose.yml -f dspace/src/main/docker-compose/docker-compose-angular.yml up -d

# Start DSpace 7 REST API and Angular UI
down-ui:
	docker-compose -p d7 -f docker-compose.yml -f dspace/src/main/docker-compose/docker-compose-angular.yml down

# Run DSpace 7 REST with IIIF Image Server
up-iiif:
	docker-compose -p d7 -f docker-compose.yml -f dspace/src/main/docker-compose/docker-compose-iiif.yml up -d

# Shutdown and remove containers
down:
	docker-compose -p d7 down

# Display help for commands
help:
	@echo "Available commands:"
	@echo "  make pull        - Pull the latest images from Docker Hub"
	@echo "  make build       - Build images from the current branch"
	@echo "  make build-jdk   - Build images with a specific JDK version (default JDK_VERSION=11)"
	@echo "  make up          - Start DSpace 7 REST API"
	@echo "  make up-ui       - Start DSpace 7 REST API and Angular UI"
	@echo "  make up-iiif     - Start DSpace 7 REST with IIIF Image Server"
	@echo "  make down        - Shutdown and remove containers"
	@echo "  make help        - Display this help"

.PHONY: all pull build build-jdk up up-ui up-iiif down help



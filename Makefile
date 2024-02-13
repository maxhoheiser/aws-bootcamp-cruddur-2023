include .env

# Build Docker image
docker-build:
	docker-compose build

# Push Docker image to registry
docker-push:
	docker-compose push

# Authenticate docker to push to ecr
docker-login:
	aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com

# Build and push Docker image to registry
docker-update: 
	docker-build docker-login docker-push
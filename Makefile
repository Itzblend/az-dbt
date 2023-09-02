VENV_PATH='az-dbt/bin/activate'
DOCKER_NAME='ds_dbt'
DOCKER_TAG='0.0.1'
AZURE_CONTAINER_REGISTRY='dndsregistry.azurecr.io'

lint:
	black src/

install:
	python3 -m pip install --upgrade pip
	# Used for packaging and publishing
	pip install setuptools wheel twine
	# Used for linting
	pip install black
	# Used for testing
	pip install pytest

env:
	source .env

run-dev-env:
	docker-compose up -d

build:
	docker build -f docker/dbt/Dockerfile -t $(AZURE_CONTAINER_REGISTRY)/$(DOCKER_NAME):$(DOCKER_TAG) .

push:
	docker push $(AZURE_CONTAINER_REGISTRY)/$(DOCKER_NAME):$(DOCKER_TAG)

run:
	docker run -it --env-file .env $(AZURE_CONTAINER_REGISTRY)/$(DOCKER_NAME):$(DOCKER_TAG)

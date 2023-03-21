PROJECT = $(shell basename $(shell pwd))
ID = rfm/${PROJECT}

build:
	podman build \
		--build-arg PROJECT=${PROJECT} \
		--tag ${ID} .

run:
	podman run \
		--name ${PROJECT} \
		--hostname ${PROJECT} \
		--volume $(shell pwd):/opt/${PROJECT} \
		--interactive \
		--tty \
		--rm \
		${ID} \
		bash

exec:
	podman exec \
		--interactive \
		--tty \
		${PROJECT} \
		bash

###

all: format lint 

black:
	python -m black --preview .

isort:
	python -m isort .

format: black isort  ## run the formatters

lint:  ## run the linters
	python -m pylama

generate:
	python generate.py
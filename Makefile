.PHONY: build push

build: 
	docker-compose build --parallel

push:
	docker-compose push



.PHONY build push

.build:
	docker-compose build

.push:
	docker-compose push bin
	docker-compose push bin-cloud
	docker-compose push desk
	docker-compose push golang
	docker-compose push gradle
	docker-compose push maven
	docker-compose push node
	docker-compose push openfaas
	docker-compose push python
	docker-compose push php
	docker-compose push ruby



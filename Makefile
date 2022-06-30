.PHONY: build push

build: 
	docker buildx bake -f docker-compose.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose-without-arm.yml \
		--set "*.platform=linux/amd64"

push:
	docker buildx bake -f docker-compose.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose-without-arm.yml \
		--push \
		--set "*.platform=linux/amd64"

push.dev:
	docker buildx bake -f docker-compose.dev.yml \
		--push \
		--set dev.platform=linux/amd64,linux/arm64

push.rust:
	docker buildx bake -f docker-compose.rust.yml \
		--push \
		--set rust.platform=linux/amd64,linux/arm64

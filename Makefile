.PHONY: build push

build: 
	docker buildx bake -f docker-compose.yml \
	--set=node*.platform=linux/amd64,linux/arm64 \
	--set=golang*.platform=linux/amd64,linux/arm64 \
	--set=python*.platform=linux/amd64,linux/arm64 \
	--set=ruby.platform=linux/amd64,linux/arm64 \
	--set=php.platform=linux/amd64,linux/arm64 \
	--set=maven.platform=linux/amd64,linux/arm64 \
	--set=dotnetcore*.platform=linux/amd64,linux/arm64 \
	--set=*.output=type=docker \
	--set=*.output=type=registry

build.dev: 
	docker buildx bake -f docker-compose.dev.yml \
		--set=*.output=type=docker \
		--set=*.output="type=registry" \
		--set=dev.platform=linux/amd64,linux/arm64

build.rust: 
	docker buildx bake -f docker-compose.rust.yml \
		--set=*.output=type=docker \
		--set=*.output="type=registry" \
		--set rust.platform=linux/amd64,linux/arm64
.PHONY: build push

build: 
	docker buildx bake \
		--push \
		--set node*.platform=linux/amd64,linux/arm64 \  
		--set golang*.platform=linux/amd64,linux/arm64 \
		--set python*.platform=linux/amd64,linux/arm64 \
		--set ruby.platform=linux/amd64,linux/arm64 \
		--set php.platform=linux/amd64,linux/arm64 \
		--set maven.platform=linux/amd64,linux/arm64 \
		--set dotnetcore*.platform=linux/amd64,linux/arm64

build.dev: 
	docker buildx bake \
		--push \
		--set dev.platform=linux/amd64,linux/arm64

build.rust: 
	docker buildx bake \
		--push \
		--set rust.platform=linux/amd64,linux/arm64

.PHONY: build push

build:
	echo "Building golang" && docker buildx bake -f docker-compose.golang.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building node" && docker buildx bake -f docker-compose.node.yml \
		--set "*.platform=linux/amd64,linux/arm64"

push:
	docker buildx bake -f docker-compose.golang.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose.node.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"

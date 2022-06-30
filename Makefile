.PHONY: build push

build: 
	docker buildx bake --push --set node*.platform=linux/amd64,linux/arm64`



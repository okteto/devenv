.PHONY: build push

build: 
	docker buildx bake \
		--push \
		--set node*.platform=linux/amd64,linux/arm64 \  
		--set golang*.platform=linux/amd64,linux/arm64 \
		--set python*.platform=linux/amd64,linux/arm64 \
		--set ruby*.platform=linux/amd64,linux/arm64 \
		--set php*.platform=linux/amd64,linux/arm64 \

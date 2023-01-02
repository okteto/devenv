.PHONY: build

build: 
	echo "Building dev" && docker buildx bake -f docker-compose.dev.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building golang" && docker buildx bake -f docker-compose.golang.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building node" && docker buildx bake -f docker-compose.node.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building php" && docker buildx bake -f docker-compose.php.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building python" && docker buildx bake -f docker-compose.python.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building ruby" && docker buildx bake -f docker-compose.ruby.yml \
		--set "*.platform=linux/amd64,linux/arm64"
	echo "Building without arm" && docker buildx bake -f docker-compose-without-arm.yml \
		--set "*.platform=linux/amd64"

push:
	docker buildx bake -f docker-compose.dev.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose.golang.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose.node.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose.php.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose.python.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose.ruby.yml \
		--push \
		--set "*.platform=linux/amd64,linux/arm64"
	docker buildx bake -f docker-compose-without-arm.yml \
		--push \
		--set "*.platform=linux/amd64"

push.rust:
	docker buildx bake -f docker-compose.rust.yml \
		--push \
		--set rust.platform=linux/amd64,linux/arm64

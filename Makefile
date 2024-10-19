.PHONY: clean build

build: clean build_dist

install:
	@echo "Install npm"
	npm install

build_dist:
	@echo "Build dist"
	npm run build

clean:
	@echo "Cleaning up..."
	rm -rf dist \
	rm -f *.tsbuildinfo

dev:
	@echo "run dev mode..."
	npm run dev

docker_build:
	@echo "build docker image..."
	docker build -t vite-with-docker .

docker_run:
	@echo "run docker ..."
	docker run -p 5173:3000 vite-with-docker
include .env
export

test:
	true

image:
	docker build --build-arg PHP_VERSION=${PHP_VERSION} -t ${IMAGE}:${IMAGE_VERSION} .
	docker tag ${IMAGE}:${IMAGE_VERSION} ${IMAGE}:latest

push-image:
	docker push ${IMAGE}:${IMAGE_VERSION}
	docker push ${IMAGE}:latest

.PHONY: image push-image test
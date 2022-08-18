build-image:
	docker build -t build-byndid-version-checker:latest .

shell:
	docker run -it --env-file .secrets --rm -v $(shell pwd):/build --name build-byndid-version-checker build-byndid-version-checker:latest /bin/sh

shell-asroot:
	docker run --user=root -it --env-file .secrets --rm -v $(shell pwd):/build --name build-byndid-version-checker build-byndid-version-checker:latest /bin/sh

run:
	docker run --env-file .secrets --rm --name build-byndid-version-checker build-byndid-version-checker:latest

build-image:
	docker build -t build-byndid-version-checker:latest .

shell:
	docker run -it --rm -v $(shell pwd):/build --name build-byndid-version-checker build-byndid-version-checker:latest /bin/sh

shell-asroot:
	docker run --user=root -it --rm -v $(shell pwd):/build --name build-byndid-version-checker build-byndid-version-checker:latest /bin/sh

run:
	docker run --rm --name build-byndid-version-checker build-byndid-version-checker:latest

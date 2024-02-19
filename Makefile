RUN_PHP_IMAGE:=docker run --rm --user $(shell id -u) -v "${PWD}/:/app/" -w /app tennis-kata:php
RUN_COMPOSER_IMAGE:=docker run --rm --user $(shell id -u) -v "${PWD}/:/app/" -w /app tennis-kata:composer

# If the first argument is "composer"...
ifeq (composer,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "composer"
  COMPOSER_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(COMPOSER_ARGS):;@:)
endif

.PHONY: help init clean docker-build composer

help: ## Shows current Makefile's goals with a brief summary
	@grep -E '^[^:]+:.*?## .*$$' $(MAKEFILE_LIST) | grep -v grep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sort

init: clean docker-build composer ## Initializes a docker environment and installs composer dependencies with it

clean: ## Removes and cleans all generated files, docker images and composer dependencies
	rm -Rf .php-cs-fixer.cache .phpunit.cache .phpunit.result.cache bin composer.lock var vendor
	docker rmi -f tennis-kata:php tennis-kata:composer

docker-build: ## Builds the docker environment images
	docker build --target tennis-kata-php -t tennis-kata:php .
	docker build --target tennis-kata-composer -t tennis-kata:composer .

composer: ## Installs composer dependencies. It also lets you run scripts and other commands e.g. make composer check-cs
	${RUN_COMPOSER_IMAGE} $(COMPOSER_ARGS)

composer.json composer.lock vendor:
	$(MAKE) composer install

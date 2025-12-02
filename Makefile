PROJECT_NAME = symfony-app

.PHONY: up down build logs bash-php composer-install migrate

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

bash-php:
	docker compose exec php bash

composer-install:
	docker compose run --rm php composer install

migrate:
	docker compose exec php php bin/console doctrine:database:create --if-not-exists || true
	docker compose exec php php bin/console doctrine:migrations:migrate --no-interaction

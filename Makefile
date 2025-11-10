SHELL := /usr/bin/bash

up:
	docker compose -f docker-compose.dev.yml up -d --build

down:
	docker compose -f docker-compose.dev.yml down

logs:
	docker compose -f docker-compose.dev.yml logs -f --tail=200

ps:
	docker compose -f docker-compose.dev.yml ps

nuke:
	docker compose -f docker-compose.dev.yml down -v

psql:
	docker exec -it $$(docker ps -qf name=postgres) psql -U user -d kadracoon

mongo:
	docker exec -it $$(docker ps -qf name=mongo) mongosh

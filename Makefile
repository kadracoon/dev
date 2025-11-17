UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin) # macos
    SHELL := /bin/bash
endif

ifeq ($(UNAME_S),Linux) # linux
    SHELL := /usr/bin/bash
endif

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

migrate:
	docker compose -f docker-compose.dev.yml exec backend alembic upgrade head

downgrade:
	docker compose -f docker-compose.dev.yml exec backend alembic downgrade -1

revision:
	docker compose -f docker-compose.dev.yml exec backend alembic revision --autogenerate -m "$(m)"

shell:
	docker compose -f docker-compose.dev.yml exec backend bash

reset-db:
	docker compose -f docker-compose.dev.yml down -v && docker compose -f docker-compose.dev.yml up -d --build

seed:
	docker compose -f docker-compose.dev.yml exec backend python -c "print('TODO: seed data')"


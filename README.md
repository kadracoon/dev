0. Создать каталог для проекта
```sh
mkdir kadracoon
```

1. Склонировать репозитории и зайти в каталог `dev`
```sh
git clone git@github.com:kadracoon/tmdb-sync.git
git clone git@github.com:kadracoon/backend.git
git clone git@github.com:kadracoon/frontend.git
git clone git@github.com:kadracoon/dev.git
cd dev
```

2. Заполнить `.env.dev.`:
```sh
# BACKEND
DATABASE_URL=postgresql+asyncpg://user:password@postgres:5432/kadracoon
ALEMBIC_DATABASE_URL=postgresql+psycopg://user:password@postgres:5432/kadracoon
MONGO_URI=mongodb://mongo:27017/tmdb
JWT_SECRET=dev-secret

# TMDB-SYNC
tmdb_api_key=<CHANGEME>
mongo_url=mongodb://mongo:27017
mongo_db=tmdb
```

3. Запустить приложения:
```sh
make up
```

4. Применить миграции:
```sh
make migrate
```

5. Перейти в каталог `fronted` и запустить установку пакетов `Svelte`/`SvelteKit`:
```
cd ..
cd frontend
bun i
```

6. Скачать 1000 фильмов
1000
```sh
http://0.0.0.0:8001/docs#/default/sync_by_top_votes_sync_top_votes_post
```

```sh
http://0.0.0.0:8001/docs#/default/get_sync_status_sync_status_get
```

7. Создать коллекцию
```sh
curl -X 'POST' \
  'http://0.0.0.0:8000/collections' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "test 100",
  "slug": "test-100",
  "description": "string",
  "type": "ONE_FRAME_FOUR_TITLES",
  "rule": {
    "filters": {
      "_type": "movie",
      "year_from": 1900,
      "year_to": 2025,
      "genre_ids": [
        0
      ],
      "country": "string",
      "is_animated": false
    },
    "sort": {
      "by": "vote_count",
      "order": "desc"
    },
    "limit": 100
  }
}'
```
ответ
```sh
{
  "id": 1,
  "slug": "test-100"
}
```

8 Скомпиллировать коллекцию
```sh
curl -X 'POST' \
  'http://0.0.0.0:8000/collections/1/compile' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "overrides": {
    "additionalProp1": {}
  },
  "seed": 0
}'
```
Ответ
```sh

{
  "collection_id": 1,
  "version_id": 1
}
```

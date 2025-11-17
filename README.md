# dev

```sh
git clone
git clone
git clone
git clone
cd dev
```

Extensions: python, svelte, mongodb, Makefile

```sh
make up
```

```sh
make migrate
```

```
cd..
cd frontend
bun i
```

1000
```sh
http://0.0.0.0:8001/docs#/default/sync_by_top_votes_sync_top_votes_post
```

```sh
http://0.0.0.0:8001/docs#/default/get_sync_status_sync_status_get
```

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

local-up:
	docker compose build
	docker compose up -d --remove-orphans
	docker cp ./volumes/fromhost.txt dockerize-volume-one:/app
local-down:
	docker compose stop

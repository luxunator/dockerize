local-up:
	docker compose build
	docker compose up -d --remove-orphans
local-down:
	docker compose stop

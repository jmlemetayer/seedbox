.PHONY: all
all: up

.PHONY: up
up:
	docker-compose up --detach

.PHONY: down
down:
	docker-compose down --rmi all

.PHONY: clean
clean: down
	docker volume prune --force \
		--filter label=com.docker.compose.project=seedbox \
		--filter label!=com.docker.compose.volume=traefik

.PHONY: mrproper
mrproper: down
	docker volume prune --force \
		--filter label=com.docker.compose.project=seedbox

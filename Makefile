.PHONY: all
all: up

.PHONY: up
up:
	docker-compose up --detach

.PHONY: down
down:
	docker-compose down --rmi all

FILTER_PROJECT := --filter=label=com.docker.compose.project=seedbox

KEEP_PATTERN := traefik transmission

VOLUME_LS_ARGS := ${FILTER_PROJECT} $(addprefix | grep -v ,${KEEP_PATTERN})

.PHONY: clean
clean: down
	for VOLUME in $$(docker volume ls --quiet ${VOLUME_LS_ARGS}); \
	do \
		docker volume remove --force $${VOLUME}; \
	done

.PHONY: mrproper
mrproper: down
	docker volume prune --force ${FILTER_PROJECT}

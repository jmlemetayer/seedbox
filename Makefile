PROJECT := seedbox

DOCKER_COMPOSE := docker compose -p ${PROJECT}

.PHONY: install
install:
	${DOCKER_COMPOSE} up --build --detach

.PHONY: uninstall
uninstall:
	${DOCKER_COMPOSE} down --rmi all

.PHONY: reinstall
reinstall:
	${MAKE} uninstall
	${MAKE} install

.PHONY: mrproper
mrproper: uninstall
	docker volume prune --force --filter=label=com.docker.compose.project=${PROJECT}

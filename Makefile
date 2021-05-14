.PHONY: install
install:
	docker-compose up --build --detach

.PHONY: uninstall
uninstall:
	docker-compose down --rmi all

.PHONY: reinstall
reinstall:
	${MAKE} uninstall
	${MAKE} install

.PHONY: mrproper
mrproper: uninstall
	docker volume prune --force --filter=label=com.docker.compose.project=seedbox

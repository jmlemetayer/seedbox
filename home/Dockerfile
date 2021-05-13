FROM	httpd:2.4

COPY	docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT	["docker-entrypoint.sh"]

# The CMD must be re-defined because it is deleted when an entry point is added
CMD	["httpd-foreground"]

HELP_FUN = \
		 %help; \
		 while(<>) { \
		 	push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z0-9_-]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/ \
		 }; \
		 print "usage: make [target]\nexample: make help\n\n"; \
		 for ( sort keys %help ) { \
		 	print "$$_:\n"; \
			printf("  %-20s %s\n", $$_->[0], $$_->[1]) for @{$$help{$$_}}; \
			print "\n"; \
		 }

help: ##@Miscellaneous Show this help
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

start-mk:
	@docker-compose up --build --detach ${SERVICE}
stop-mk:
	@docker-compose rm --force --stop ${SERVICE}
data-mk:
	@docker volume rm ${VOLUME}

start-mysql: ##@MySQL Starts MySQL Container
	@make -s start-mk SERVICE=mysql
stop-mysql: ##@MySQL Stops the MySQL Container
	@make -s stop-mk SERVICE=mysql
connect-mysql: ##@MySQL Connect to the MySQL Container via CLI
	@mysql -h mysql -uroot -psecret test_db
data-mysql: ##@MySQL Removes the MySQL data
	@make -s data-mk VOLUME=mydata

start-postgres: ##@PostgreSQL Starts PostgreSQL Container
	@make -s start-mk SERVICE=postgres
stop-postgres: ##@PostgreSQL Stops the PostgreSQL Container
	@make -s stop-mk SERVICE=postgres
connect-postgres: ##@PostgreSQL Connect to the PostgreSQL Container via CLI
	@PGPASSWORD=secret psql -h postgres -Uroot test_db
data-postgres: ##@PostgreSQL Removes the PostreSQL data
	@make -s data-mk VOLUME=pgdata

start: ##@General Starts all Database containers
	@make -s start-mysql && make -s start-postgres
stop: ##@General Stops all Database containers
	@make -s stop-mysql && make -s stop-postgres
data: ##@General Deletes all Database data
	@make -s data-mysql && make -s data-postgres
terminate: ##@General Deletes all containers and configuration to start from fresh
	@docker-compose down --remove-orphans --rmi all --volumes
all: up

up:
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

start:
	@docker compose -f ./srcs/docker-compose.yml start

fclean:
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm $$(docker network ls -q) 2>/dev/null
	@rm -rf /Users/stijn/sschelti/wordpress /Users/stijn/sschelti/mariadb
	@mkdir /Users/stijn/sschelti/wordpress /Users/stijn/sschelti/mariadb
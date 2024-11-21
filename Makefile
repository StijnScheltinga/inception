all: up

up:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

build:
	@sudo docker compose -f ./srcs/docker-compose.yml build --no-cache

fclean:
	@sudo docker stop $$(sudo docker ps -qa)
	@sudo docker rm $$(sudo docker ps -qa)
	@sudo docker rmi -f $$(sudo docker images -qa)
	@sudo docker volume rm $$(sudo docker volume ls -q)
	@-sudo docker network rm $$(sudo docker network ls -q) 2>/dev/null
	@sudo rm -rf /home/sschelti/data/wordpress /home/sschelti/data/mariadb
	@mkdir /home/sschelti/data/wordpress /home/sschelti/data/mariadb

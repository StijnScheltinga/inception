all: up

up:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

fclean:
	@sudo docker stop $$(docker ps -qa)
	@sudo docker rm $$(docker ps -qa)
	@sudo docker rmi -f $$(docker images -qa)
	@sudo docker volume rm $$(docker volume ls -q)
	@sudo docker network rm $$(docker network ls -q) 2>/dev/null
	@sudo rm -rf /home/sschelti/data/wordpress /home/sschelti/data/mariadb
	@sudo mkdir /home/sschelti/data/wordpress /home/sschelti/data/mariadb
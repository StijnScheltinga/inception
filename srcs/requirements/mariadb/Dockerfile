FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/startup.sh /

RUN chmod 777 /startup.sh

CMD ["bash", "/startup.sh"]
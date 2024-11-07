FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get install -y nginx \
	&& apt-get install -y openssl

EXPOSE 80

COPY ./conf/default /etc/nginx/sites-enabled/

COPY ./tools/startup.sh /

CMD ["nginx", "-g", "daemon off;"]

# CMD ["sleep", "infinity"]
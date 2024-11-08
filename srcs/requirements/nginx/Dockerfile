FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /nginx-selfsigned.key -out /nginx-selfsigned.crt \
	-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/OU=Student/CN=sschelti.42.fr"

CMD ["nginx", "-g", "daemon off;"]
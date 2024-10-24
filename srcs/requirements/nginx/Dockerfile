FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx openssl

EXPOSE 80

CMD ["startup.sh"]
FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
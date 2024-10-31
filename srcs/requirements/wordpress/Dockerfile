FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y php \
	&& apt-get install -y curl
	
COPY ./tools/startup.sh /

RUN chmod 777 /startup.sh

CMD ["bash", "/startup.sh"]
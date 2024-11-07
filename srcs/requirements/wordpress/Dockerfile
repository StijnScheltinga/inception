FROM debian:latest

RUN apt-get update \
	&& apt-get install -y \
	curl \
	php8.2 \
	php8.2-fpm \
	php-mysqli
	
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

# dowloading wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x ./wp-cli.phar \
	&& mv ./wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/startup.sh /
RUN chmod +x /startup.sh

CMD ["bash", "/startup.sh"]
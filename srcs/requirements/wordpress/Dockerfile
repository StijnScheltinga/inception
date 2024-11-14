FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y \
	curl \
	php7.4 \
	php7.4-fpm \
	php-mysqli
	
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# dowloading wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x ./wp-cli.phar \
	&& mv ./wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/startup.sh /
RUN chmod +x /startup.sh

CMD ["bash", "/startup.sh"]
FROM alpine/git AS git
RUN git clone https://github.com/goltaraya/agenda-de-devs.git /tmp/agenda

FROM php:8.0-apache AS php-stage
RUN apt-get update -y && apt-get install -y libmariadb-dev 
RUN docker-php-ext-install pdo_mysql mysqli pdo && docker-php-ext-enable pdo_mysql mysqli pdo
WORKDIR  /var/www/html
COPY --from=git /tmp/agenda/ /var/www/html/
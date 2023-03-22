FROM alpine/git AS git
RUN git clone https://github.com/goltaraya/agenda-de-devs.git /tmp/agenda

FROM php:8.0-apache AS php-stage
WORKDIR  /var/www/html
COPY --from=git /tmp/agenda /var/www/html/

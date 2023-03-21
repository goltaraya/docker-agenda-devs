FROM php:7.4-alpine as php-stage
RUN mkdir /opt/agenda-devs
# WORKDIR /opt/agenda-devs
RUN addgroup -S dev && adduser -S dev -G dev
RUN apk --update add git
RUN chown -R dev:dev /opt/agenda-devs
USER dev:dev
RUN git clone https://github.com/goltaraya/agenda-de-devs.git /opt/agenda-devs

FROM httpd:alpine
COPY --from=php-stage ./opt/agenda-devs/* /usr/local/apache2/htdocs/

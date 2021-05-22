FROM alpine

RUN apk update && apk add nginx nodejs \
    && adduser -D -g 'www' www \
    && mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www \
    && mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig \
    && mkdir -p /run/nginx
COPY --chown=www:www nginx.conf /etc/nginx/
COPY --chown=www:www index.html /www/

EXPOSE 8080
ENTRYPOINT /usr/sbin/nginx


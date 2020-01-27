FROM nginx:1-alpine

RUN apk --no-cache add openssl

RUN openssl dhparam -out /etc/ssl/private/default.dhparam 2048

RUN openssl req \
    -newkey rsa:2048 -nodes -keyout /etc/ssl/private/default.key \
    -x509 -days 365 -out /etc/ssl/private/default.crt \
    -subj "/CN=example.com" \
    && chmod 640 /etc/ssl/private/default.*

ADD nginx.conf /etc/nginx/conf.d/default.conf

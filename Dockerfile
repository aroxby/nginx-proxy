FROM nginx:1-alpine

RUN apk --no-cache add openssl

RUN openssl dhparam -out /etc/ssl/private/default.dhparam 2048

# TODO: We would like to generate this at run time
ARG SSL_CN=example.com
RUN openssl req \
    -newkey rsa:2048 -nodes -keyout /etc/ssl/private/default.key \
    -x509 -days 365 -out /etc/ssl/private/default.crt \
    -subj "/CN=${SSL_CN}" \
    && chmod 640 /etc/ssl/private/default.*

ADD nginx.conf /etc/nginx/conf.d/default.conf

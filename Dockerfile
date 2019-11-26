FROM nginx:1-alpine

RUN apk --no-cache add openssl

# FIXME: We should generate this at run time
RUN openssl req \
    -newkey rsa:2048 -nodes -keyout /etc/ssl/private/default.key \
    -x509 -days 365 -out /etc/ssl/private/default.crt \
    -subj "/CN=example.com" \
    && chmod 640 /etc/ssl/private/default.*

ADD nginx.conf /etc/nginx/conf.d/default.conf

FROM nginx:1-alpine

ADD nginx.conf /etc/nginx/conf.d/default.conf

FROM nginx:1.15-alpine

LABEL maintainer="Ryo Ota <nwtgck@gmail.com>"

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./docker_entry.sh /docker_entry.sh

CMD ["/docker_entry.sh"]

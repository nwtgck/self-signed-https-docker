FROM nginx:1.19.6-alpine

LABEL maintainer="Ryo Ota <nwtgck@gmail.com>"

# Install openssl
RUN apk add openssl

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./docker_entry.sh /docker_entry.sh

CMD ["/docker_entry.sh"]

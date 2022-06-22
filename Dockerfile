FROM ubuntu:22.04

# add non root user to image
RUN addgroup www && \
    adduser www --no-create-home --ingroup www --disabled-password --shell /bin/bash --uid 1000 --gecos ""

# Install nginx and nginx-mod-rtmp
RUN apt update && \
    apt upgrade -y && \
    apt install nginx libnginx-mod-rtmp

# make nginx config available in docker volume /config
RUN mkdir /config && \
    cp -n /etc/nginx/nginx.conf /config/nginx.conf && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.old && \
    ln -sf /config/nginx.conf /etc/nginx/nginx.conf


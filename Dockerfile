FROM ubuntu:22.04

# add non root user to image
RUN addgroup www && \
    adduser www --no-create-home --ingroup www --disabled-password --shell /bin/bash --uid 1000 --gecos ""

FROM debian:bookworm-slim
LABEL maintainer="djelenc@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=en_US.UTF-8
ENV LANG=${LC_ALL}
ENV LANGUAGE=${LC_ALL}

RUN echo "#log: Configuring locales" \
 && set -x \
 && apt-get update \
 && apt-get install -y locales \
 && echo "${LC_ALL} UTF-8" | tee /etc/locale.gen \
 && locale-gen ${LC_ALL} \
 && dpkg-reconfigure locales \
 && sync

RUN echo "#log: Preparing system" \
 && set -x \
 && apt-get update -y \
 && apt-get install -y \
  npm \
  git


RUN echo "#log: Preparing marked" \
 && npm install -g marked
FROM debian:stable-slim

ENV DENO_VERSION=1.9.0
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update \
 && apt-get -qq install -y --no-install-recommends curl ca-certificates unzip make \
 && curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip \
         --output deno.zip \
 && unzip deno.zip \
 && rm deno.zip \
 && chmod 755 deno \
 && mv deno /usr/bin/deno \
 && apt-get -qq remove --purge -y curl ca-certificates unzip \
 && apt-get -y -qq autoremove \
 && apt-get -qq clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && mkdir /deno-dir \
 && mkdir -p  /usr/local/etc/bash_completion.d \
 && deno completions bash > /usr/local/etc/bash_completion.d/deno.bash

ENV DENO_DIR /deno-dir/
ENV DENO_INSTALL_ROOT /usr/local

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc
FROM golang:1.22-bookworm

ARG VERSION=3.16.2
ARG PLUGIN_UNITTEST_VERSION=0.6.3

RUN curl -sLf --retry 3 -o helm.tar.gz https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz && \
    mkdir -p helm && tar -C helm -xf helm.tar.gz && \
    cp helm/linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    /usr/local/bin/helm version

RUN helm plugin install https://github.com/helm-unittest/helm-unittest --version v${PLUGIN_UNITTEST_VERSION}

CMD ["/bin/sh"]
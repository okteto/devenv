FROM docker:stable AS docker
FROM syncthing/syncthing:1.3.0 AS syncthing
FROM okteto/remote:latest AS remote

FROM alpine:latest as builder

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
    
# install kubectl
RUN curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install okteto
RUN curl -L https://downloads.okteto.com/cli/okteto-Linux-x86_64 -o /usr/local/bin/okteto
RUN chmod +x /usr/local/bin/okteto

# install helm3
RUN wget https://get.helm.sh/helm-v3.0.0-beta.3-linux-amd64.tar.gz -O /tmp/helm-v3.0.0-beta.3-linux-amd64.tar.gz && \
    tar -xvzf /tmp/helm-v3.0.0-beta.3-linux-amd64.tar.gz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
    rm -Rf /tmp/* && \
    chmod +x /usr/local/bin/helm

FROM busybox

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY --from=remote /usr/local/bin/remote /usr/local/bin/remote
COPY --from=syncthing /bin/syncthing /usr/local/bin/syncthing
COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=builder /usr/local/bin/okteto /usr/local/bin/okteto
COPY --from=builder /usr/local/bin/helm /usr/local/bin/helm

# copy start
COPY bin/start.sh /usr/local/bin/start.sh
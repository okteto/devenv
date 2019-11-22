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
RUN curl -fSL https://github.com/okteto/okteto/releases/download/1.5.8/okteto-Linux-x86_64 -o /usr/local/bin/okteto
RUN chmod +x /usr/local/bin/okteto

# install helm
RUN curl -L https://get.helm.sh/helm-v3.0.0-linux-amd64.tar.gz -o /tmp/helm-v3.0.0-linux-amd64.tar.gz
RUN tar -xvzf /tmp/helm-v3.0.0-linux-amd64.tar.gz -C /tmp
RUN mv /tmp/linux-amd64/helm /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm

# Test
RUN helm version
RUN kubectl version --client
RUN okteto version

FROM busybox

COPY --from=remote /usr/local/bin/remote /usr/local/bin/remote
COPY --from=syncthing /bin/syncthing /usr/local/bin/syncthing
COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=builder /usr/local/bin/okteto /usr/local/bin/okteto
COPY --from=builder /usr/local/bin/helm /usr/local/bin/helm

# copy start
COPY bin/start.sh /usr/local/bin/start.sh
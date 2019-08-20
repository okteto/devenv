FROM docker:stable AS docker

FROM alpine:latest

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
    
# install docker client
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

# install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# install kubectl
RUN curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install okteto
RUN curl https://get.okteto.com -sSfL | sh

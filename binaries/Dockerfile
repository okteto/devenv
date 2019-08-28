FROM moby/buildkit:rootless AS buildkit

FROM alpine:latest

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
    
# install buildkit
COPY --from=buildkit /usr/bin/buildctl /usr/local/bin/buildctl

# install kubectl
RUN curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install skaffold
RUN curl -L https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 -o /usr/local/bin/skaffold
RUN chmod +x /usr/local/bin/skaffold

# install okteto
RUN curl https://get.okteto.com -sSfL | sh

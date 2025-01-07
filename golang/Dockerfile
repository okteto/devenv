ARG VERSION="1.23"
ARG DEBIAN_VERSION="bookworm"
ARG AIR_VERSION="v1.61.5"
FROM golang:${VERSION}-${DEBIAN_VERSION}

ARG CONTROLLER_GEN_VERSION="v0.16.5"

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go install github.com/codegangsta/gin@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install golang.org/x/tools/gopls@latest && \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@${CONTROLLER_GEN_VERSION} && \
    go install github.com/air-verse/air@${AIR_VERSION}

CMD ["bash"]

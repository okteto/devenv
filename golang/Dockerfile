ARG VERSION="1.24.6"
ARG DEBIAN_VERSION="bookworm"
FROM golang:${VERSION}-${DEBIAN_VERSION} as build

ARG CONTROLLER_GEN_VERSION="v0.17.3"
ARG DLV_VERSION="v1.26.0"
ARG AIR_VERSION="v1.61.5"
ARG GOPLS_VERSION="v0.21.0"

# buildx provides these automatically for multi-arch
ARG TARGETARCH

RUN go install github.com/codegangsta/gin@latest && \
    go install github.com/go-delve/delve/cmd/dlv@${DLV_VERSION} && \
    go install golang.org/x/tools/gopls@${GOPLS_VERSION} && \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@${CONTROLLER_GEN_VERSION} && \
    curl -fsSL "https://github.com/cosmtrek/air/releases/download/${AIR_VERSION}/air_${AIR_VERSION#v}_linux_${TARGETARCH}.tar.gz" | tar -xz -C /usr/local/bin air

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]

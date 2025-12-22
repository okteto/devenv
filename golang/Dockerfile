ARG VERSION="1.25.5"
ARG DEBIAN_VERSION="bookworm"
FROM golang:${VERSION}-${DEBIAN_VERSION}

ARG CONTROLLER_GEN_VERSION="v0.20.0"
ARG DLV_VERSION="v1.26.0"
ARG AIR_VERSION="v1.63.4"
ARG GOPLS_VERSION="v0.21.0"
ARG GIN_VERSION="v0.0.0-20230218063734-2c98d96c9244"

# buildx provides these automatically for multi-arch
ARG TARGETARCH

ENV GOBIN=/usr/local/bin
ENV PATH="/usr/local/bin:${PATH}"

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    set -eux; \
    go install github.com/codegangsta/gin@${GIN_VERSION}; \
    go install github.com/go-delve/delve/cmd/dlv@${DLV_VERSION}; \
    go install golang.org/x/tools/gopls@${GOPLS_VERSION}; \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@${CONTROLLER_GEN_VERSION}; \
    curl -fsSL "https://github.com/cosmtrek/air/releases/download/${AIR_VERSION}/air_${AIR_VERSION#v}_linux_${TARGETARCH}.tar.gz" | tar -xz -C /usr/local/bin air

WORKDIR /usr/src/app

COPY bashrc /root/.bashrc
CMD ["bash"]

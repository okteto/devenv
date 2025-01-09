ARG VERSION="1.23"
ARG DEBIAN_VERSION="bookworm"
FROM golang:${VERSION}-${DEBIAN_VERSION}

ARG CONTROLLER_GEN_VERSION="v0.16.5"
ARG DLV_VERSION="latest"
ARG AIR_VERSION="v1.61.5"
ARG GOPLS_VERSION="latest"

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go install github.com/codegangsta/gin@latest && \
    go install github.com/go-delve/delve/cmd/dlv@${DLV_VERSION} && \
    go install golang.org/x/tools/gopls@${GOPLS_VERSION} && \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@${CONTROLLER_GEN_VERSION} && \
    curl -sSfL https://raw.githubusercontent.com/air-verse/air/master/install.sh | sh -s -- -b /usr/bin -d ${AIR_VERSION}ggt

CMD ["bash"]

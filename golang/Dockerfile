ARG VERSION="1.24.2"
ARG DEBIAN_VERSION="bookworm"
FROM golang:${VERSION}-${DEBIAN_VERSION} as build

ARG CONTROLLER_GEN_VERSION="v0.17.3"
ARG DLV_VERSION="latest"
ARG AIR_VERSION="v1.61.5"
ARG GOPLS_VERSION="latest"

RUN go install github.com/codegangsta/gin@latest && \
    go install github.com/go-delve/delve/cmd/dlv@${DLV_VERSION} && \
    go install golang.org/x/tools/gopls@${GOPLS_VERSION} && \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@${CONTROLLER_GEN_VERSION} && \
    curl -sSfL https://raw.githubusercontent.com/air-verse/air/master/install.sh | sh -s -- -b /usr/bin -d ${AIR_VERSION}


FROM golang:${VERSION}-${DEBIAN_VERSION}
WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

COPY --from=build /usr/bin/air /usr/bin/air
COPY --from=build /go/bin /go/bin

CMD ["bash"]

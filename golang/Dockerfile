ARG VERSION="1.23"
ARG DEBIAN_VERSION="bookworm"
FROM golang:${VERSION}-${DEBIAN_VERSION}

ARG CONTROLLER_GEN_VERSION="v0.16.5"

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go install github.com/codegangsta/gin@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install golang.org/x/tools/gopls@latest && \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@${CONTROLLER_GEN_VERSION}
RUN curl -sSfL https://raw.githubusercontent.com/air-verse/air/master/install.sh | sh -s -- -b /usr/bin

CMD ["bash"]

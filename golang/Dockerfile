ARG VERSION="1.22"
ARG DEBIAN_VERSION="bookworm"
FROM golang:${VERSION}-${DEBIAN_VERSION}

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go install github.com/codegangsta/gin@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install golang.org/x/tools/gopls@latest && \
    curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/bin -d v1.42.0

CMD ["bash"]

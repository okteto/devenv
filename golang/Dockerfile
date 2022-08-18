ARG VERSION=1.18
FROM golang:$VERSION-buster

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go get github.com/codegangsta/gin && \
    go get github.com/go-delve/delve/cmd/dlv && \
    go get golang.org/x/tools/gopls && \
    curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/bin

CMD ["bash"]

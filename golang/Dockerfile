ARG VERSION=1.17
FROM golang:$VERSION-buster

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go get github.com/codegangsta/gin && \
    go get -u github.com/go-delve/delve/cmd/dlv && \
    go get -u golang.org/x/tools/gopls && \
    curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/bin

CMD ["bash"]

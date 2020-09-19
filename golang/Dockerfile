FROM golang:1.15-buster

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN go get github.com/codegangsta/gin && \
    go get -u github.com/go-delve/delve/cmd/dlv && \
    go get -u golang.org/x/tools/gopls

CMD ["bash"]

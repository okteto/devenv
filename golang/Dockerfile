FROM golang:1.12
WORKDIR /app
# setup okteto message
COPY bashrc /root/.bashrc

RUN go get github.com/codegangsta/gin && \
    go get -u github.com/go-delve/delve/cmd/dlv

CMD ["bash"]

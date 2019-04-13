FROM golang:1.12
WORKDIR /app
# setup okteto message
COPY bashrc /root/.bashrc

RUN go get github.com/codegangsta/gin

CMD ["bash"]

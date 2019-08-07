FROM golang:1.12

ENV GOBIN /go/src/handler/function

RUN userdel _apt
RUN groupdel users
RUN groupadd -g 100 app
RUN rm -Rf /home/app
RUN useradd -m -u 100 -g 100 app

WORKDIR /go/src/handler
RUN chown app:app /go/src/handler

COPY bashrc /home/app/.bashrc
RUN chown app:app /home/app/.bashrc

COPY openfaas/main.go main.go
RUN chown app:app main.go

USER app
CMD ["bash"]

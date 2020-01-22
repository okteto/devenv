FROM openfaas/of-watchdog:0.7.2 as watchdog

FROM okteto/golang:1

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog

RUN chmod +x /usr/bin/fwatchdog && \
    addgroup --gid 12000 app && \
    adduser --home /home/app --uid 12000 --gid 12000 app && \
    echo 'Welcome to your development environment. Happy coding!' > /etc/mod && \
    echo 'export PS1="\[\e[32m\]okteto\[\e[m\]> "' >> /home/app/.bashrc

COPY scripts/* /usr/local/bin/
USER app

RUN mkdir -p /home/app/handler/function
WORKDIR /home/app/handler

ADD --chown=app:app https://raw.githubusercontent.com/openfaas-incubator/golang-http-template/master/template/golang-middleware/main.go /home/app/handler/
ADD --chown=app:app https://raw.githubusercontent.com/openfaas-incubator/golang-http-template/master/template/golang-middleware/go.mod /home/app/handler/

ENV fprocess="./handler"
ENV mode="http"
ENV upstream_url="http://127.0.0.1:8082"
CMD ["fwatchdog"]

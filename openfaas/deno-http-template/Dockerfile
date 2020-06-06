FROM austinrivas/deno-http-base:stable

WORKDIR ${FUNC_HOME_DIR}

RUN chown fnUser:fnGroup -R /usr/local \
    && apk --no-cache add bash \
    && echo 'Welcome to your development environment. Happy coding!' > /etc/mod \
    && echo 'export PS1="\[\e[32m\]okteto\[\e[m\]> "' >> .bashrc

USER fnUser

ADD --chown=fnUser:fnGroup https://raw.githubusercontent.com/austinrivas/deno-http-template/master/template/deno-http/main.ts .
ADD --chown=fnUser:fnGroup https://raw.githubusercontent.com/austinrivas/deno-http-template/master/template/deno-http/lib/wrapper.ts ./lib
ADD --chown=fnUser:fnGroup https://raw.githubusercontent.com/austinrivas/deno-http-template/master/template/deno-http/function/handler.ts ./function

RUN deno cache function/handler.ts main.ts

CMD ["fwatchdog"]
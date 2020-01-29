FROM python:3
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y zip git
RUN python -m venv --copies /opt/okteto/venv

# setup okteto message and set the dev venv
COPY python/bashrc /root/.bashrc

CMD ["bash"]
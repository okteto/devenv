FROM python:3

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN apt-get update && apt-get install -y zip git

CMD ["bash"]
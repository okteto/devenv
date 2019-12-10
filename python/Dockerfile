FROM python:3
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y zip git

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]
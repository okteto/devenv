FROM python:3

WORKDIR /src

# setup okteto message
COPY bashrc /root/.bashrc

RUN apt-get update && apt-get install -y zip git

CMD ["bash"]
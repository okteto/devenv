FROM python:3
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y zip git
COPY python/requirements.txt requirements.txt
RUN pip install -r requirements.txt
# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]
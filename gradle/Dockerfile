ARG VERSION=8.2.1-jdk17
FROM gradle:$VERSION

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /home/gradle/.bashrc

CMD ["bash"]

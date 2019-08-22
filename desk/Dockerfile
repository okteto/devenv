FROM docker:stable AS docker

FROM ubuntu:18.04

# install docker client
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

# add keys and install golang, ruby and nodejs
RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get install -y software-properties-common build-essential git curl zlib1g-dev openssh-server && \
    add-apt-repository -y ppa:longsleep/golang-backports && \
    apt-get -y update && \
    apt-get install -y golang-go ruby-full nodejs yarn && \
    gem install bundler  && \
    mkdir /var/run/sshd && \
    mkdir /root/.ssh && \
    echo PermitUserEnvironment yes >> /etc/ssh/sshd_config

RUN curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl https://get.okteto.com -sSfL | sh

RUN apt-get clean
    
# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]

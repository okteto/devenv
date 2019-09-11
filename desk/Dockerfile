FROM docker:stable AS docker

FROM ubuntu:18.04

# install docker client
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

# add keys and install golang, ruby and nodejs
RUN apt-get -y update && \
    apt-get install -y curl wget git locales bash-completion && \
    ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    locale-gen en_US.UTF-8 && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get install -y software-properties-common build-essential git curl zlib1g-dev openssh-server && \
    add-apt-repository -y ppa:longsleep/golang-backports && \
    apt-get -y update && \
    apt-get install -y golang-go ruby-full nodejs yarn python3-dev python3-pip && \
    gem install bundler  && \
    mkdir /var/run/sshd && \
    mkdir /root/.ssh && \
    echo PermitUserEnvironment yes >> /etc/ssh/sshd_config

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    wget https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz -O /tmp/helm-v2.14.3-linux-amd64.tar.gz && \
    tar -zxvf /tmp/helm-v2.14.3-linux-amd64.tar.gz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    helm init --client-only

RUN curl https://get.okteto.com -sSfL | sh
RUN apt-get clean -y && apt-get autoremove -y
    
# setup okteto message
RUN rm /etc/update-motd.d/*
COPY bashrc /root/.bashrc

CMD ["bash"]

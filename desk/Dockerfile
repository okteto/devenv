FROM docker:18.09.1 AS docker

FROM ubuntu:18.04

# install docker client
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

# install golang & ruby
RUN apt-get -y update
RUN apt-get install -y build-essential git-core curl zlib1g-dev
RUN apt-get install -y golang-go
RUN apt-get install -y ruby-full && gem install bundler 

# install nodejs 10 and yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

# install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# install kubectl
RUN curl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install okteto
RUN curl https://get.okteto.com -sSfL | sh

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]

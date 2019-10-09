FROM docker:stable AS docker

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
    gem install bundler

RUN apt-get clean -y && apt-get autoremove -y
    
# setup okteto message
RUN rm /etc/update-motd.d/*
COPY bashrc /root/.bashrc

CMD ["bash"]

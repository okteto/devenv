ARG VERSION=2
FROM ruby:$VERSION

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN gem install bundler

CMD ["bash"]

ARG VERSION=2
FROM ruby:$VERSION

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

# TODO: Forcing bundler version because v2.4.22 was the last one to support ruby v2. We should remove this once we upgrade to ruby v3
RUN gem install bundler -v 2.4.22

CMD ["bash"]

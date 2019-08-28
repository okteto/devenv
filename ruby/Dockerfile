FROM ruby:2
WORKDIR /usr/src/app

RUN gem install bundler

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]
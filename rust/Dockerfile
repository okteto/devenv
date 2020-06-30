FROM rust:1
ENV DEBIAN_FRONTEND=noninteractive

RUN rustup component add rustfmt clippy rls rust-analysis rust-src && \
  apt-get update && \
  apt-get install -y gdb && \
  apt-get autoremove -y && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]
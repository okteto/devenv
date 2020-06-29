FROM rust:1

RUN rustup component add rustfmt clippy rls

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]
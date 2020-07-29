FROM rust:1

# setup okteto message
COPY bashrc /root/.bashrc

RUN curl https://github.com/engineerd/wasm-to-oci/releases/download/v0.1.1/linux-amd64-wasm-to-oci > /usr/local/bin/wasm-to-oci && \
    chmod +x /usr/local/bin/wasm-to-oci && \
    apt-get update && \
    apt-get install -y gdb && \
    cargo install nkeys --features "cli" && \
    cargo install wascap --features "cli" && \
    cargo install wasm-pack && \
    cargo install just

CMD ["bash"]
ARG VERSION=3
FROM python:$VERSION

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

# Handle different Debian versions and Python 2 EOL issues
RUN set -ex && \
    python --version && \
    if python --version 2>&1 | grep -q "Python 2"; then \
        echo "Detected Python 2, using archived Debian repositories" && \
        rm -rf /var/lib/apt/lists/* && \
        apt-get clean && \
        echo "deb [check-valid-until=no] http://archive.debian.org/debian/ buster main" > /etc/apt/sources.list && \
        echo "deb [check-valid-until=no] http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
        apt-get -o Acquire::Check-Valid-Until=false update; \
    else \
        echo "Detected Python 3, using standard repositories" && \
        apt-get update; \
    fi && \
    apt-get install -y zip git && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]

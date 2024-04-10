ARG VERSION=8.0
FROM mcr.microsoft.com/dotnet/sdk:$VERSION as base

RUN apt-get update && apt-get install -y unzip procps && \
    curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /root/vsdbg && \
    curl -L "https://data.services.jetbrains.com/products/download?code=RRD&platform=linux64" -o /tmp/RiderRemoteDebugger.zip && \
    mkdir -p /root/.local/share/JetBrains/RiderRemoteDebugger/2024.1 && \
    unzip /tmp/RiderRemoteDebugger.zip -d /root/.local/share/JetBrains/RiderRemoteDebugger/2024.1 && \
    curl -L "https://download.jetbrains.com/rider/ssh-remote-debugging/linux-x64/jetbrains_debugger_agent_20230319.24.0" -o /usr/local/bin/debugger && \
    chmod +x /usr/local/bin/debugger && \
    rm -rf /var/lib/apt/lists/*
    
FROM mcr.microsoft.com/dotnet/sdk:$VERSION

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

COPY --from=base /root/vsdbg /usr/local/bin/vsdbg
COPY --from=base /usr/local/bin/debugger /usr/local/bin/debugger
COPY --from=base /root/.local/share/JetBrains/RiderRemoteDebugger/2024.1 /root/.local/share/JetBrains/RiderRemoteDebugger/2024.1

CMD ["bash"]

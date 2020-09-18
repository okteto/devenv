FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as base

RUN apt-get update && apt-get install -y unzip
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /root/vsdbg

FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR /src

# setup okteto message
COPY bashrc /root/.bashrc

COPY --from=base /root/vsdbg /usr/local/bin/vsdbg

CMD ["bash"]
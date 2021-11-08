ARG VERSION=6.0
FROM mcr.microsoft.com/dotnet/sdk:$VERSION as base

RUN apt-get update && apt-get install -y unzip
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /root/vsdbg

FROM mcr.microsoft.com/dotnet/sdk:$VERSION

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

COPY --from=base /root/vsdbg /usr/local/bin/vsdbg

CMD ["bash"]
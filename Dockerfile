
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  git \
  curl \
  wget \
  ca-certificates \
  unzip

WORKDIR /packages
RUN wget -q https://minecraft.azureedge.net/bin-linux/bedrock-server-1.17.11.01.zip
RUN unzip bedrock-server-1.17.11.01.zip -d /opt/bedrock-server
COPY config/server.properties /opt/bedrock-server/server.properties

WORKDIR /opt/bedrock-server
RUN LD_LIBRARY_PATH=.
CMD ["/opt/bedrock-server/bedrock_server"]


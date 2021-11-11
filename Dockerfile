FROM ubuntu:focal
LABEL maintainer="quest <quest@mac.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget libxcb-xinput0

RUN mkdir build
WORKDIR build

RUN wget https://update.u.is/downloads/linux/utopia-latest.amd64.deb
RUN wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb
RUN apt-get install -y ./utopia-latest.amd64.deb ./uam-latest_amd64.deb

WORKDIR /opt/uam

CMD /opt/uam/uam --pk $PUBLIC_KEY --no-ui

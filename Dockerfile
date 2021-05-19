FROM ubuntu:xenial
LABEL maintainer="quest <quest@mac.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget
RUN wget https://update.u.is/downloads/linux/utopia-latest.amd64.deb
RUN wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb
RUN apt-get install -y ./utopia-latest.amd64.deb ./uam-latest_amd64.deb

CMD /opt/uam/uam --pk $PUBLIC_KEY --no-ui
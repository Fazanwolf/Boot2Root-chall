FROM ubuntu:latest

RUN apt update -y && apt upgrade -y
RUN apt install -y nano vim sudo ufw iproute2 software-properties-common

ENV DEBIAN_FRONTEND=noninteractive

RUN service ufw start

WORKDIR /app

COPY . .

RUN LC_ALL=C.UTF-8 add-apt-repository -y $(sed -n 1p requirements.txt)

RUN apt install -y $(sed -n 2p requirements.txt) > /dev/null

CMD ./exec.sh
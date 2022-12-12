FROM ubuntu:latest

RUN apt update -y && apt upgrade -y
RUN apt install -y nano vim sudo ufw iproute2

RUN service ufw start

WORKDIR /app

COPY . .

RUN config/setup.sh

CMD ./exec.sh
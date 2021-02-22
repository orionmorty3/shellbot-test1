


###########################################################################################################################################################################################################################################################################################################################################################################################



FROM ubuntu:latest



RUN chmod 777 ./
RUN chmod +x ./



ENV DEBIAN_FRONTEND = noninteractive
ENV TZ = Asia/Kolkata
ENV LANG en_US.utf8

ENV PORT = 22/tcp
EXPOSE 22/tcp

ENV PORT = 3000/tcp
EXPOSE 3000/tcp

ENV PORT = 7000/tcp
EXPOSE 7000/tcp

ENV PORT = 8000/tcp
EXPOSE 8000/tcp

ENV PORT = 8000/udp
EXPOSE 8000/udp

ENV PORT = 9666/tcp
EXPOSE 9666/tcp

ENV PORT = 9666/udp
EXPOSE 9666/udp

RUN apt-get -qq update ; \
    apt-get -y upgrade ; \
    apt-get -qq update ; \
    apt-get -qq install -y \
    sudo \
    curl \
    wget \
    iputils-ping ; \
    apt-get -qq install -y \
    ufw \
    jq ; \
    apt-get -qq update ; \
    apt-get -qq install -y \
    git \
    nmap \
    neofetch \
    unzip \
    unrar \
    tar \
    openssh-server \
    docker.io \
    net-tools \
    python3.9 \
    python3-pip \
    npm \
    make \
    build-essential \
    gnupg2 \
    ffmpeg \
    p7zip \
    screen ; \
    apt-get -qq update
###

RUN curl https://rclone.org/install.sh | bash ; \
    pip3 install --upgrade pip ; \
    apt-get -qq install -y --fix-missing --fix-broken ; \
    apt-get -qq update
###

RUN apt-get -qq update ; \
    ufw allow 22/tcp ; \
    ufw allow 3000/tcp ; \
    ufw allow 7000/tcp ; \
    ufw allow 8000/tcp ; \
    ufw allow 8000/udp ; \
    ufw allow 9666/tcp ; \
    ufw allow 9666/udp
###

WORKDIR /home/app/

RUN git clone https://github.com/MOOGAA/TGSB ; \
    cd TGSB ; \
    npm install
###

COPY config.json /home/app/TGSB/

###COPY * .

RUN echo " CONFIG SET "

WORKDIR /home/app/TGSB

RUN echo " Starting Processes ___ . . . ... … "

CMD node server



###########################################################################################################################################################################################################################################################################################################################################################################################

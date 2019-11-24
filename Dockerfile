FROM python:2.7.17-stretch
MAINTAINER snokendrutt@hotmail.com

RUN apt-get update -y ; apt-get upgrade -y ; apt-get install sudo apt-transport-https lsb-release ca-certificates wget nginx net-tools nano -y
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg ; echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list ; apt-get update -y ; apt-get install php7.2 -y
RUN pip install --upgrade pip
WORKDIR /root
RUN git clone https://github.com/BullsEye0/blue_eye.git
WORKDIR /root/blue_eye
RUN pip install -r requirements.txt
ENV xterm
ENTRYPOINT ["python", "/root/blue_eye/blue_eye.py"]

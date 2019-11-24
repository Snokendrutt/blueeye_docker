FROM python:2.7.17-stretch
MAINTAINER snokendrutt@hotmail.com

RUN apt-get update -y ; apt-get upgrade -y ; apt-get install nano -y
RUN pip install --upgrade pip
WORKDIR /root
RUN git clone https://github.com/BullsEye0/blue_eye.git
WORKDIR /root/blue_eye
RUN pip install -r requirements.txt

RUN sed -i 's/033\[34m/033\[33m/g' /root/blue_eye/blue_eye.py
RUN sed -i 's/»/-/g' /root/blue_eye/blue_eye.py
ENTRYPOINT ["python", "/root/blue_eye/blue_eye.py"]

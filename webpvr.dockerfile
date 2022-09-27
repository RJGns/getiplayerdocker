FROM ubuntu
ARG IP
RUN echo "${IP}"
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:m-grant-prg/utils
RUN apt-get install wget
RUN apt-get update && apt-get install -y get-iplayer
RUN sed -i "s|\$LISTEN|${IP} |g" /usr/bin/get_iplayer_web_pvr

RUN wget -P /etc/systemd/system/ https://raw.githubusercontent.com/RJGns/getiplayerdocker/main/ip.service
RUN chmod 664 /etc/systemd/system/ip.service



EXPOSE 1935:1935
RUN get_iplayer_web_pvr &

ENTRYPOINT ["tail", "-f", "/dev/null"]

ROM ubuntu
ARG IP
RUN echo "${IP}"
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:m-grant-prg/utils
RUN apt-get install wget
RUN apt-get update && apt-get install -y get-iplayer
RUN sed -i "s|\$LISTEN|${IP} |g" /usr/bin/get_iplayer_web_pvr

EXPOSE 1935:1935
ENTRYPOINT ["get_iplayer_web_pvr"]

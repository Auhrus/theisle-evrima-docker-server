FROM cm2network/steamcmd:root

MAINTAINER "https://github.com/Auhrus"

LABEL org.opencontainers.image.source https://github.com/Auhrus/theisle-evrima-docker-server
LABEL maintainer https://github.com/Auhrus

EXPOSE 8888-8888 10000-10000 7777-7778/tcp
EXPOSE 7777-7778/udp

ENV additionalcommands=""
ENV updateonstart="false"
ENV steambranch="evrima"

RUN apt update && apt install procps -y

RUN mkdir -p "/home/steam/Steam/steamapps/common/The Isle Dedicated Server/" \
	&& chown 1000:1000 -R /home/steam/Steam/steamapps/

COPY ./serverstart.sh /home/steam/serverstart.sh
RUN chmod +x /home/steam/serverstart.sh

USER steam
WORKDIR /home/steam/
CMD ["/home/steam/serverstart.sh"]
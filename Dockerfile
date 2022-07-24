FROM cm2network/steamcmd:root
MAINTAINER "https://github.com/Auhrus"
LABEL org.opencontainers.image.source https://github.com/Auhrus/theisle-evrima-docker-server
EXPOSE 8888-8888 10000-10000 7777-7778/tcp
EXPOSE 7777-7778/udp
ENV additionalcommands=""
RUN apt update && apt install procps -y
RUN mkdir -p /home/steam/theisle-dedicated/TheIsle/Saved/Config/LinuxServer && mkdir /home/steam/theisle-dedicated/TheIsle/Saved/PlayerData && chown 1000:1000 -R /home/steam/theisle-dedicated && chmod 755 -R /home/steam/theisle-dedicated
COPY ./startup.sh /home/steam/steamcmd/startup.sh
COPY ./serverstart.sh /home/steam/steamcmd/serverstart.sh
RUN chmod +x /home/steam/steamcmd/startup.sh && chmod +x /home/steam/steamcmd/serverstart.sh && chown 1000:1000 -R /home/steam/steamcmd/serverstart.sh /home/steam/steamcmd/startup.sh
USER steam
CMD ["/home/steam/steamcmd/startup.sh"]

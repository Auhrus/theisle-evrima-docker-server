FROM cm2network/steamcmd:root
EXPOSE 8888-8888 10000-10000 7777-7778/tcp
EXPOSE 7777-7778/udp
ENV ip=""
ENV port="7777"
ENV queryport="7778"
RUN apt update && apt install procps -y
RUN mkdir -p /home/steam/theisle-dedicated/TheIsle/Saved/Config/LinuxServer && mkdir /home/steam/theisle-dedicated/TheIsle/Saved/PlayerData && chown 1000:1000 -R /home/steam/theisle-dedicated && chmod 755 -R /home/steam/theisle-dedicated
COPY ./startup.sh /home/steam/steamcmd/startup.sh
COPY ./serverstart.sh /home/steam/steamcmd/serverstart.sh
RUN chmod +x /home/steam/steamcmd/startup.sh && chmod +x /home/steam/steamcmd/serverstart.sh && chown 1000:1000 -R /home/steam/steamcmd/serverstart.sh /home/steam/steamcmd/startup.sh
USER steam
CMD ["/home/steam/steamcmd/startup.sh"]
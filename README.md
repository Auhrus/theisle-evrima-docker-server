# TheIsle Evrima Docker Server 🦖

This image provides a TheIsle beta Evrima server. After the first start it downloads the necessary files from the Steam servers. If there is an update to the server files, simply recreate the container without having to re-download the image. It will download everything again (just in new) and you can continue.
## Content🧾

* [Deployment👩‍💻](https://github.com/Auhrus/theisle-evrima-server-docker#deployment)
* [Environment Variables🔢](https://github.com/Auhrus/theisle-evrima-server-docker#environment-variables)
* [Update⏫](https://github.com/Auhrus/theisle-evrima-server-docker#update)
* [Official Documentation📖](https://github.com/Auhrus/theisle-evrima-server-docker#original-documentation)
* [Support❤️](https://github.com/Auhrus/theisle-evrima-server-docker#support)

## Deployment👩‍💻

How to install this Docker Container

1. Install Docker on your Server. Here you can find a guide [[here]](https://duckduckgo.com/?t=ffab&q=How+to+install+Docker+on+Ubuntu)
2. Run that command
```bash
docker run --name CONAINER_NAME -p 7777-7778:7777-7778/tcp -p 8888:8888/tcp -p 10000:10000/tcp -p 7777-7778:7777-7778/udp -v VOLUME_NAME:/home/steam/theisle-dedicated/TheIsle/Saved/Config/LinuxServer -v VOLUME_NAME:/home/steam/theisle-dedicated/TheIsle/Saved/PlayerData -e ip=YOUR_PUBLIC_IP ghcr.io/auhrus/theisle-evrima-docker-server:latest
```
Please replace all things written in CAPS.

3. After all data has been downloaded, restart the container.
```bash
docker restart CONAINER_NAME
```
4. After that the TheIsle server starts again it generates the save files, etc.

### NOTICE ‼️
The server does not create the .ini files itself, they must be created manually on the volume. The "basic-configs" folder contains the minimum configuration requirements for starting the server.

## Environment Variables🔢

To run this project, you will need to set the following environment variables.

| Variable      | Function      | Default |
|:------------- |:-------------:|:-------------|
| `ip`   |Put here your Public Server IP address for the "MultiHome" argument on the start command (see below)|mandatory|
| `port`   |Game Server Port for sending Data to the Clients|7777|
| `queryport`       |Server Query Port|7778|
| `additionalcommands`       |Here you can add (if needed) additional commands to start the server.|--|

The server start command:

/home/steam/theisle-dedicated/TheIsleServer.sh MultiHome=$ip?Port=$port?QueryPort=$queryport?$additionalcommands -log



## Update⏫

How do i update my TheIsle Server to a newer Version?

1. First stop and remove the existing Container.
```bash
docker stop CONAINER_NAME && docker rm CONAINER_NAME
```
2. Then create him again like in the [Deployment👩‍💻](https://github.com/Auhrus/theisle-evrima-server-docker#deployment) with the same Volumes.

## Support❤️

If you find any bugs have improvements for this Documentation or have any other suggestions/improvements, please post a bug report or feature suggestion in the 
[Issues Tab](https://github.com/Auhrus/theisle-evrima-server-docker/issues).

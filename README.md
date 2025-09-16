# TheIsle Evrima Docker Server 🦖

This image provides a TheIsle Beta Evrima server. After the first start it downloads the necessary files from the Steam servers. Have fun Dino bros 😊
## Content🧾

* [Deployment👩‍💻](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#deployment)
* [IMPORTANT‼️](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#important%EF%B8%8F)
* [Environment Variables🔢](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#environment-variables)
* [Update⏫](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#update)
* [Support❤️](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#support%EF%B8%8F)

## Deployment👩‍💻

How to install this Docker Container

1. Install Docker on your Server. Here you can find a guide [[here]](https://duckduckgo.com/?t=ffab&q=How+to+install+Docker+on+Ubuntu)
2. Run that command
```bash
docker run --name CONTAINER_NAME -p 7777:7777/tcp -p 7777:7777/udp -p 10000:10000/tcp -v VOLUME_NAME:"/home/steam/Steam/steamapps/common/The Isle Dedicated Server" ghcr.io/auhrus/theisleevrima:latest
```
Please replace all things written in CAPS.

3. After all data has been downloaded, the server tries to start.
4. Now take the files from [basic-configs](https://github.com/Auhrus/theisle-evrima-docker-server/tree/main/basic-configs) and add them to this (.../TheIsle/Saved/Config/LinuxServer/) folder inside your volume.
5. Now open the Game.ini and set everything as you would like it. Then save the file.
6. After you have added and configured them, you can now start the container again. This time it should start completely. If that is not the case, something is wrong in the Game.ini. Then check it for typos. And read the README entry [IMPORTANT‼️](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#important%EF%B8%8F)


## IMPORTANT‼️
- Make sure that the folder of the volumes have the owner and group 1000:1000.

- The server does not create the .ini files itself, they must be created manually on the volume. The "[basic-configs](https://github.com/Auhrus/theisle-evrima-docker-server/tree/main/basic-configs)" folder contains the minimum configuration requirements for starting the server.

- There are several beta branches since November 16, 2023. The map Isla Sprio is only in branch "spiro0.11.59.04" the map Gateway is in branch "evrima". If the Isla Sprio map is supposed to be loaded, "MapName=Gateway" must be removed from the Game.ini or a `#` must be added to the front.

- If you get the error "DATA ACQUISITION FAILED" when joining your server. Check if you have the setting in the Game.ini "bQueueEnabled" set to true. If it is set to true, you must also open port 10000 (TCP only).

## Environment Variables🔢

To run this project, you will need to set the following environment variables.

| Variable      | Function      | Default |
|:------------- |:-------------:|:-------------|
| `steambranch`       |Defines which branch should be downloaded from Steam. If you want to play the Isla Sprio Map you have to enter "spiro0.11.59.04". For the latest version with the Map Gateway you have to enter "evrima"|evrima|
| `additionalcommands`       |Here you can add (if needed) additional commands to start the server.|--|
| `updateonstart`       |Defines whether the server should check for updates every time it is started.|false|

The server start command:

"/home/steam/Steam/steamapps/common/The Isle Dedicated Server/TheIsleServer.sh" $additionalcommands -log



## Update⏫

How do i update my TheIsle Server to a newer Version?

If you have `updateonstart` set to true, you only need to restart the container and the SteamCMD will check for updates. If it is set to false do the following:

1. First stop and remove the existing Container.
```bash
docker stop CONTAINER_NAME && docker rm CONTAINER_NAME
```
2. Then create him again like in the [Deployment👩‍💻](https://github.com/Auhrus/theisle-evrima-docker-server?tab=readme-ov-file#deployment) with the same Volumes.

## Support❤️

If you find any bugs have improvements for this Documentation or have any other suggestions/improvements, please post a bug report or feature suggestion in the 
[Issues Tab](https://github.com/Auhrus/theisle-evrima-docker-server/issues).
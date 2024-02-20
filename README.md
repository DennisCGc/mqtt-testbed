# Distributed MQTT testbed based on docker compose
This repo contains a docker compose and then specific container configurations.

## Docker Compose Concept
### Pre-requisites
The docker compose configuration has the following pre-requisites:
* a docker network has to be created before hand with the following command
```
$ docker network create --gateway 10.5.0.254 --subnet 10.5.0.0/16 mqtt-net
```
* an mqtt-stresser docker container needs to be created from the mqtt-stresser submodule with the following command
```
$ make container
```
* empty logs have to be created, due to the way Docker volume mounts work
```
$ ./setup-logs.sh
```

### Services
Once the pre-requisites are met, the services can be started with
```
docker-compose up
```
Docker will create the following services
* MQTT Broker 1
* MQTT Broker 2
* MQTT Broker 3
* MQTT stresser 1
* MQTT stresser 2
* MQTT stresser 3
* MQTT collectd 1
* MQTT collectd 2
* MQTT collectd 3
* cloud bridge

### Brokers
Brokers 1 to 3 have specific detailed configuration to startup and configure channel bridges to the <i>cloud-bridge</i>. Each subfolder contains a dedicated configuration for each broker, where logging and bridging can be modified.

### Stressers
Stressers are containers running https://github.com/inovex/mqtt-stresser/ which need to be pre-built and available to the docker engine.
This is already considered by the creators of the stresser, so all it takes is
```
cd mqtt-stresser
make container
```

The stress configurations are inside the docker-compose configuration, they are not persistent and so their configuration exists purely as a command line set of parameters within the container definition in docker.
For other options see https://stackoverflow.com/questions/51999953/load-testing-services-for-mqtt

### collectd
Collectd is not available as a package pre-built with mqtt support, so included in the repo there is a copy of the collectd source repo and a Dockerfile used to build a custom collectd image used by the compose environment.
In order to correctly build the image, the only thing needed is to assign it the proper tag
```
cd collectd-docker
docker build . -t collectd:custom-mqtt
```

## Visualizing MQTT data
There are many ways to visualize what goes on MQTT channels and brokers. One is mosquitto clients, like pub/sub from the command line. More advanced are UI tools like https://mqtt-explorer.com/ and https://mqttx.app/ which can connect to mulitple brokers at the same time and visualize topic updates.

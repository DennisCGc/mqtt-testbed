# Distributed MQTT testbed based on docker compose
This repo contains a docker compose and then specific container configurations.

## Pre-requisites
The docker compose configuration has the following pre-requisites:
* a docker network has to be created before hand with the following command
```
$ docker network create --gateway 10.5.0.254 --subnet 10.5.0.0/16 mqtt-net 
```
* an mqtt-stresser docker container needs to be created from the mqtt-stresser submodule with the following command
```
$ make container
```

## Services
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
* cloud bridge

## Brokers
Brokers 1 to 3 have specific detailed configuration to startup and configure channel bridges to the <i>cloud-bridge</i>. Each subfolder contains a dedicated configuration for each broker, where logging and bridging can be modified.

## Stressers
Stressers are configured inside the docker-compose configuration, they are not persistent and so their configuration exists purely as a command line set of parameters within the container definition in docker.


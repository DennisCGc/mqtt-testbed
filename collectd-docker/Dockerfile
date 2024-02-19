FROM        debian:bookworm

RUN         apt-get update
RUN         DEBIAN_FRONTEND=noninteractive apt-get install -y \
  apt-utils file automake build-essential pkg-config mosquitto-dev libmosquitto-dev \
  default-jre bison

ADD         ./collectd-5.12.0 /mnt/collectd-source

RUN         cd /mnt/collectd-source && \
            ./configure --enable-mqtt > config.log && \
            make install

# FROM        debian:bookworm-slim

# ADD         collectd-5.12.0 /mnt/collectd-built

# RUN         apt-get update
# RUN         DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils file
# RUN         DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc-12 pkg-config
# RUN         cd /mnt/collectd-built && make install

#RUN         apt-get update && apt-get install -y libtool
#RUN         libtool --finish /opt/collectd/lib/collectd

CMD         exec /opt/collectd/sbin/collectd -f -C /etc/collectd/collectd.conf

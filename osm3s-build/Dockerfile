#Create an enviroment to build an OSM Overpass server image
FROM debian:latest
MAINTAINER guido.eco@crinstitute.org.uk

RUN apt-get update || exit 1
RUN apt-get dist-upgrade -y
RUN apt-get install dnsutils g++ make expat libexpat1-dev zlib1g-dev openssh-server -y

ENV USER osm
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo
ENV DB_DIR=/var/lib/osm3s/db
ENV EXEC_DIR=/var/lib/osm3s
ENV PLANET_FILE=/var/lib/osm3s/archive
ENV REPLICATE_DIR=/var/lib/osm3s/sync

WORKDIR /home/osm

COPY profile .profile
RUN mkdir -p /var/lib/osm3s/archive /var/lib/osm3s/db /var/lib/osm3s/sync /var/www/osm3s/public_html /opt/build /var/log/overpass
COPY osm-3s_v0.7.54.tar.gz /opt/build

RUN chown -R osm:osm /opt/* /var/lib/osm3s
RUN cd /opt/build && tar zxf /opt/build/osm-3s_v0.7.54.tar.gz && cd osm-3s_v0.7.54 && ./configure CXXFLAGS="-O3" --prefix=$EXEC_DIR && make install
RUN cd /home/osm && tar cvfz osm3s-var.tar.gz $EXEC_DIR

RUN mkdir /var/run/sshd

ADD ssh-keys .ssh
RUN chown -R $USER:$USER /home/$USER/.ssh
RUN chmod 700 /home/$USER/.ssh
RUN chmod 600 /home/$USER/.ssh/authorized_keys

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]

#Create an OSM overpass server 
FROM debian:latest
MAINTAINER guido.eco@crinstitute.org.uk

ENV USER osm
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo

RUN apt-get update || exit 1
RUN apt-get install expat apache2 bzip2 dnsutils -y
RUN a2enmod cgi ext_filter

ENV DB_DIR=/opt/osm3s/db
ENV EXEC_DIR=/var/lib/osm3s
ENV PLANET_FILE=/opt/osm3s/archive
ENV REPLICATE_DIR=/opt/osm3s/sync

WORKDIR /home/osm
COPY profile .profile
RUN mkdir -p /opt/osm3s/db /opt/osm3s/archive /opt/osm3s/sync /var/www/osm3s/public_html /var/log/overpass
COPY osm-index.html /var/www/osm3s/public_html/index.html
COPY osm3s.conf /etc/apache2/sites-available/

ADD osm3s-var.tar.gz /
RUN chown -R osm:osm /opt/*
RUN mv /var/lib/osm3s/cgi-bin /var/www/osm3s
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www
RUN cd /etc/apache2/sites-available/ && a2ensite osm3s.conf && service apache2 restart

COPY init-db.sh query.sh query.xml /home/osm/

COPY overpass /etc/init.d/
COPY dispatcher.sh /var/lib/osm3s/bin
RUN cd /etc/init.d && chown root:root overpass && chmod 755 overpass
RUN update-rc.d overpass defaults
RUN update-rc.d overpass enable

EXPOSE 80
CMD /etc/init.d/overpass start && /usr/sbin/apache2ctl -D FOREGROUND


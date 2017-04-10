#!/bin/sh
docker rm osm-build
docker build -t geco/osm3s-build:latest .
docker run -d --name osm-build --net dockernet --ip 172.18.1.4 -P geco/osm3s-build:latest
docker stop osm-build

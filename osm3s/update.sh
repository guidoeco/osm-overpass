docker rm osm-server
mkdir $HOME/data/osm3s/
docker run -it -d -v $HOME/data/osm3s/:/opt/osm3s/ --name osm-server --net dockernet --ip 172.18.1.4 -P geco/osm3s:latest


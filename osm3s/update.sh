docker rm osm-server
for i in archive sync db
do
  mkdir -p $HOME/data/osm3s/${i}
done
docker run -it -d -v $HOME/data/osm3s/:/opt/osm3s/ --name osm-server --net dockernet --ip 172.18.1.4 -P geco/osm3s:latest


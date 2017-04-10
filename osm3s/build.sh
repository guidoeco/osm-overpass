docker start osm-build
sleep 2
scp osm@osm3s-server:osm3s-var.tar.gz build/
docker stop osm-build

cd build
docker build -t geco/osm3s:latest .
cd ..

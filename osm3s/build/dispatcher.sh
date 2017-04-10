#!/bin/sh

EXEC_DIR=/var/lib/osm3s

nohup $EXEC_DIR/bin/dispatcher $@ &


#!/bin/sh

EXEC_DIR=/opt/osm3s

nohup $EXEC_DIR/bin/dispatcher $@ &


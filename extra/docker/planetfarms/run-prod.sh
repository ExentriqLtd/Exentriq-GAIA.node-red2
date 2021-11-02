#!/bin/bash
SPACE=$1
PORT=$2
VOLUME=GAIA_SPACE_$1
docker run -it --mount source=$VOLUME,target=/data -p $PORT:1880 -e DEST=prod --name art-prod-space$SPACE kbm001exe.exentriq.com:5000/exentriq/planetfarms-art

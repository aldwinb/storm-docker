#!/bin/bash

docker build -t="wurstmeister/storm:0.10.1" storm
docker build -t="wurstmeister/storm-nimbus" storm-nimbus
docker build -t="wurstmeister/storm-supervisor" storm-supervisor
docker build -t="wurstmeister/storm-ui" storm-ui

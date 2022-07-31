#!/bin/bash

ENV_FILE=/app/data/drone.env

function setPermissions() {
  chown -R cloudron:cloudron /app/data
}

function copyEnvFile() {
  cp -u /app/code/drone.env /app/data/
}

function setEnv() {
    if [ -f "$ENV_FILE" ]
    then
      export $(cat "$ENV_FILE" | xargs)
    fi
}

function start() {
  echo "==> Starting drone-server"
  /usr/local/bin/gosu cloudron:cloudron /app/code/drone-server
}

setPermissions
copyEnvFile
setEnv
start
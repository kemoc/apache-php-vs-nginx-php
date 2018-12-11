#!/usr/bin/env bash

# THIS SCRIPT MUST BE RUN FROM ./docker DIRECTORY!

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. ${DIR}/../../.env
. ${DIR}/.env.sh




# start docker network as deamon
${DOCKER_BUILD} $@

# ln -s ${APP_PATH}/vendor/ ./solr/data/

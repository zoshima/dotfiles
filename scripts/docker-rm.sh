#!/bin/bash

function prompt() {
  read -p "$1 (Y/N/y/n)? " resp

  case $resp in
    y|Y) return 0;;
    *) return 1;;
  esac
}

if prompt "stop containers?"; then
  docker stop `docker ps -qa`
fi

if prompt "remove containers?"; then
  docker rm `docker ps -qa`
fi

if prompt "remove images?"; then
  docker rmi -f `docker images -qa`
fi

if prompt "remove volumes?"; then
  docker volume rm $(docker volume ls -qf)
fi

if prompt "remove networks?"; then
  docker network rm `docker network ls -q`
fi

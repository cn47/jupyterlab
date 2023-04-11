#!/bin/bash

input_val=$1

main(){
  case "${input_val}" in
    "down" ) docker-compose down ;;
    "up"   ) docker-compose down; docker-compose up  --build -d
             sudo chmod -R 770 ~/.jupyterlab && sudo chown -R 1000:1000 ~/.jupyterlab ;;
  esac
}

main

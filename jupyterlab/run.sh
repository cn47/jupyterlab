#!/bin/bash

jupyter_home_path=${HOME}/jupyter
input_val=$1

export USER_NAME=`whoami`
export MOUNT_HOST_HOME="${HOME}:/home/host"
export MOUNT_JUPYTER_HOME="${jupyter_home_path}:/home"
export MOUNT_JUPYTER_USER_SETTINGS="./jupyter_user_settings:/home/${USER_NAME}/.jupyter/lab/user-settings"
export MOUNT_JUPYTER_NOTEBOOK_SETTINGS="./jupyter_notebook_config.py:/home/${USER_NAME}/.jupyter/jupyter_notebook_config.py"

main(){
  mkdir -p ${jupyter_home_path}/host
  mkdir -p ${jupyter_home_path}/${USER_NAME}/.jupyter/lab/user-settings

  case "${input_val}" in
    "down" ) docker-compose down ;;
    "up"   ) docker-compose down; docker-compose up  --build -d ;;
  esac
}

main

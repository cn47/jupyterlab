#!/bin/bash

jupyter_home_path=${HOME}/jupyter
input_val=$1

export USER=`whoami`
export PORT=8889
export MOUNT_HOST_HOME="${HOME}:/home/host"
export MOUNT_JUPYTER_HOME="${jupyter_home_path}:/home"
export MOUNT_JUPYTER_USER_SETTINGS="./settings/jupyter_user_settings:/home/jupyter/.jupyter/lab/user-settings"
export MOUNT_JUPYTER_NOTEBOOK_SETTINGS="./settings/jupyter_notebook_config.py:/home/jupyter/.jupyter/jupyter_notebook_config.py"
export MOUNT_IPYTHON_SETTINGS="./settings/ipython_config.py:/home/jupyter/.ipython/profile_default/ipython_config.py"
export MOUNT_PTPYTHON_SETTINGS="./settings/ptpython_config.py:/home/jupyter/.config/ptpython/config.py"

main(){
  mkdir -p ${jupyter_home_path}/host
  mkdir -p ${jupyter_home_path}/jupyter/.jupyter/lab/user-settings
  mkdir -p ${jupyter_home_path}/jupyter/.ipython/profile_default
  mkdir -p ${jupyter_home_path}/.config/ptpython

  case "${input_val}" in
    "down" ) docker-compose down ;;
    "up"   ) docker-compose down; docker-compose up  --build -d ;;
  esac
}

main

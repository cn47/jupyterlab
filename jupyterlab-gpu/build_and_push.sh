#!/bin/bash

_PYTHON_VER=3.10
 PYTHON_VER=3.10.9

docker build \
  --build-arg _PYTHON_VER=$_PYTHON_VER \
  --build-arg  PYTHON_VER=$PYTHON_VER \
  -t cn47/jupyterlab-gpu:$PYTHON_VER \
  -f Dockerfile.base .

docker push cn47/jupyterlab-gpu:$PYTHON_VER

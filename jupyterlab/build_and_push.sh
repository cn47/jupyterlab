#!/bin/bash

PYTHON_VER=3.11.1

docker build \
  --build-arg  PYTHON_VER=$PYTHON_VER \
  -t cn47/jupyterlab:$PYTHON_VER \
  -f Dockerfile.base .

docker push cn47/jupyterlab:$PYTHON_VER

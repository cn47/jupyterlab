#!/bin/bash
set -e

COMMAND=$1          # up / down
FLAVOR=${2:-gpu}    # cpu or gpu (default: gpu)
PYTHON_VER=3.13.3

if [ "$FLAVOR" != "gpu" ] && [ "$FLAVOR" != "cpu" ]; then
  echo "❌ Error: Unknown flavor $FLAVOR. Use 'gpu' or 'cpu'."
  exit 1
fi

export FLAVOR=$FLAVOR
export IMAGE_NAME="jupyterlab-$FLAVOR:$PYTHON_VER"
export RUNTIME=$([ "$FLAVOR" = "gpu" ] && echo "nvidia" || echo "")

main() {
  case "${COMMAND}" in
    down ) docker-compose down ;;
    up ) docker-compose down; docker-compose up --build -d ;;
    * ) echo "❌ Invalid command: $COMMAND. Use 'up' or 'down'." ;;
  esac
}

main

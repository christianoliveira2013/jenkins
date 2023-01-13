#!/bin/bash
docker build -t 'install-ssd' .
docker run -e IP="$1" -e PASSWORD="$2" -e ENV="$3" -e DC="$4" -d install-ssd
docker rmi install-ssd
#!/bin/bash
docker rmi $(docker images -f "dangling=true" -q) >/dev/null 2>&1



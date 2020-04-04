#!/bin/bash

sed 's/^#//g' docker/.bashrc > docker/bashrc && \
mv docker/bashrc docker/.bashrc && \
source ${PWD}/docker/.bashrc && \
nvm install v12

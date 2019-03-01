#!/usr/bin/env bash

source ../global-settings.sh

for topic in topics/*; do
    cat $topic | sed "s/_cluster-name_/${CLUSTER_NAME}/"  | kubectl apply -f -
done

#!/usr/bin/env bash

source ../global-settings.sh

for user in users/*; do
    cat $user | sed "s/_cluster-name_/${CLUSTER_NAME}/"  | kubectl apply -f -
done
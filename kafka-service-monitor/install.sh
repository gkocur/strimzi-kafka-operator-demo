#!/usr/bin/env bash

source ../global-settings.sh

cat kafka.yaml | sed "s/_cluster-name_/${CLUSTER_NAME}/"  | kubectl apply -f -

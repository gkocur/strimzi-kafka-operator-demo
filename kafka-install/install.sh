#!/bin/bash

source ../global-settings.sh
cat kafka-cluster.yaml | sed "s/_cluster-name_/${CLUSTER_NAME}/"  | kubectl apply -f -

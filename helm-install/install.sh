#!/bin/bash

# This script assumes you have helm utility already installed on your local machine. 
# It creates a serviceaccount with cluster-admin role binding named 'tiller' and install server side helm component using this sa.

kubectl apply -f tiller-serviceaccount.yaml

helm init --upgrade --service-account tiller

until helm list
do
    sleep 2
done

# add strimzi helm repo
helm repo add strimzi http://strimzi.io/charts/
helm repo update


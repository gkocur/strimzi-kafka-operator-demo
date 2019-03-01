#!/usr/bin/env bash

helm upgrade --install  --wait -f prometheus-operator-values.yaml prometheus-operator stable/prometheus-operator

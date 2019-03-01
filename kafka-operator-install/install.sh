#!/bin/bash

CHART_VERSION=0.11.0

helm upgrade --install --wait --version ${CHART_VERSION} kafka-operator strimzi/strimzi-kafka-operator

#!/bin/bash

kubectl port-forward \
  $(kubectl get pod -l app=webapp -o jsonpath="{.items[0].metadata.name}") \
  8080:8080

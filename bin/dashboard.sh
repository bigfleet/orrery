#/usr/bin/env bash

kubectl port-forward pods/$(kubectl get pods -n tekton-pipelines -lapp=tekton-dashboard -o json | jq -r .items[0].metadata.name)  9097:9097 -n tekton-pipelines
#/usr/bin/env bash

rm -f aks-kubeconfig
az aks get-credentials --resource-group eagle-centralus --name zimulator-staging --file aks-kubeconfig
az aks get-credentials --resource-group eagle-centralus --name zimulator-production --file aks-kubeconfig
az aks get-credentials --resource-group eagle-centralus --name ansible-aks-gitlab --file aks-kubeconfig
az aks get-credentials --resource-group eagle-centralus --name ansible-aks-tekton --file aks-kubeconfig
cat aks-kubeconfig >> ~/.kube/config
rm -f aks-kubeconfig

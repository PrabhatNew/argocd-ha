#!/bin/bash

# Create argocd namespace
echo "Creating argocd namespace..."
kubectl create namespace argocd
echo "argocd namespace created."

# List all namespaces to verify that argocd was created
echo "Listing all namespaces..."
kubectl get ns
echo "Namespace list displayed."

# Clone Argo CD repo..
echo "Cloning the Argo CD repo..."
git clone https://github.com/argoproj/argo-cd.git
cd /argo-cd/manifests/ha
echo "Deploying the Argo cd on HA mode..."
kubectl apply -f install.yaml -n argocd




# Deploy the argo in HA mode
#echo "Deploying the argo cd on HA mode..."
#INSTALL_YAML="install.yaml"
# Apply the deployment and service YAML files using kubectl
#kubectl apply -f $INSTALL_YAML -n argocd
#echo "Argo on HA mode Deployed."

# Get the service information for Argo CD server
echo "Getting the service information for Argo CD server..."
kubectl get svc -n argocd
echo "Service information displayed."

# Patch the Argo CD server service to be of type NodePort
echo "Patching the Argo CD server service to be of type NodePort..."
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
echo "Argo CD server service patched successfully."

# Get the updated service information for Argo CD server
echo "Getting the updated service information for Argo CD server..."
kubectl get svc -n argocd
echo "Updated service information displayed."

# Get the initial admin password for Argo CD
echo "Getting the initial admin password for Argo CD..."
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo "Initial admin password retrieved successfully."

# Deploy the ingress for Argo CD
echo "Deploying the ingress for Argo CD..."
INGRESS_YAML="ingress.yaml"
kubectl apply -f $INGRESS_YAML -n argocd
echo "Ingress for Argo CD deployed"
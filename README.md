
# Argo CD Deployment Script

This Bash script automates the deployment of Argo CD on a Kubernetes cluster in HA mode. It creates the `argocd` namespace, deploys the Argo CD server and its dependencies, configures the Argo CD server service to be of type NodePort, and deploys an ingress for Argo CD.

# Warning: You need at least 3 worker nodes as the HA mode of redis enforces Pods to run on separate nodes.

## Prerequisites

Before running this script, you must have the following:

- Access to a Kubernetes cluster with `kubectl` installed and configured
- The `install.yaml` and `ingress.yaml` files for deploying Argo CD

## Usage

To use this script, follow these steps:

1. Clone this repository using the following command:

   ````
   git clone https://github.com/PrabhatNew/argocd-ha.git
   ````

2. Change directory to the cloned repository:

   ````
   cd argocd_ha

3. Update the `INGRESS_YAML` variables in the script to match the name of your `ingress.yaml` file.

4. Make the script executable by running the following command:

   ``````
   chmod +x argocd_installHA.sh
   

5. Run the script by running the following command:

   ````
   ./argocd_installHA.sh
   `````

   The script will create the `argocd` namespace, deploy the Argo CD server and its dependencies, configure the Argo CD server service to be of type NodePort, and deploy an ingress for Argo CD. It will also output the initial admin password for Argo CD.

## Notes

- This script assumes that you want to deploy Argo CD in HA mode. If you want to deploy Argo CD in a different mode, you will need to modify the `install.yaml` file accordingly.
- This script assumes that you want to deploy the Argo CD ingress using the `ingress.yaml` file. If you want to use a different ingress configuration, you will need to modify the `ingress.yaml` file accordingly.


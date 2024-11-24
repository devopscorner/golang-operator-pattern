#!/usr/bin/env sh

export AWS_REGION="us-west-2"
export ACCOUNT_ID="111122223333"
export EKS_CLUSTER="devopspoc-eks-staging"
export EKS_VPC_ID="vpc-444455556666"
export CERT_VERSION="v1.13.2"
export SSL_CERT_ARN="arn:aws:acm:${AWS_REGION}:${ACCOUNT_ID}:certificate/HASH_NUMBER"

kubectl config use-context arn:aws:eks:us-west-2:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl create namespace cert-manager

kubectl apply -f "https://github.com/cert-manager/cert-manager/releases/download/${CERT_VERSION}/cert-manager.crds.yaml"

echo '' > cert-manager.custom.yaml

# helm template \
#   cert-manager jetstack/cert-manager \
#   --namespace cert-manager \
#   --create-namespace \
#   --version "${CERT_VERSION}"" \
#   # Example: disabling prometheus using a Helm parameter
#   # --set prometheus.enabled=false
#   # Uncomment to also template CRDs
#   --set installCRDs=true >> cert-manager.custom.yaml

helm template \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version "${CERT_VERSION}" \
  --set installCRDs=true >> cert-manager.custom.yaml

kubectl apply -f cert-manager.custom.yaml

kubectl apply -f 09-metrics-server.yaml

# curl -L -o kubectl-cert-manager.tar.gz https://github.com/jetstack/cert-manager/releases/latest/download/kubectl-cert_manager-linux-amd64.tar.gz
# tar xzf kubectl-cert-manager.tar.gz
# sudo mv kubectl-cert_manager /usr/local/bin

sleep 3

# kubectl cert-manager check api

# kubectl -f certificate-issuer-staging.yaml apply
# kubectl -f certificate-issuer-prod.yaml apply
# kubectl -f certificate-issuer-nonprod.yaml apply
# kubectl -f certificate-issuer-lab.yaml apply
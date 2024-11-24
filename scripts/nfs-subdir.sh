#!/usr/bin/env sh

AWS_REGION=us-west-2
AWS_ACCOUNT_ID=111122223333
EKS_CLUSTER=devopspoc-eks-staging

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm repo update
helm repo list

helm upgrade --install nfs-client nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --set nfs.server=fs-04e9ce24da2dabc41.efs.$AWS_REGION.amazonaws.com \
  --set nfs.path=/ \
  --set storageClass.name=nfs-client \
  --set aws.region=$AWS_REGION \
  --set nodeSelector.node=dci-app

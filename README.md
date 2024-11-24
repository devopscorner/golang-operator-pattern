# Golang RESTful API with Kubernetes Operator Pattern

[![goreport](https://goreportcard.com/badge/github.com/devopscorner/golang-operator-pattern/src)](https://goreportcard.com/badge/github.com/devopscorner/golang-operator-pattern/src)
[![all contributors](https://img.shields.io/github/contributors/devopscorner/golang-operator-pattern)](https://github.com/devopscorner/golang-operator-pattern/graphs/contributors)
[![tags](https://img.shields.io/github/v/tag/devopscorner/golang-operator-pattern?sort=semver)](https://github.com/devopscorner/golang-operator-pattern/releases)
[![docker pulls](https://img.shields.io/docker/pulls/devopscorner/golang-operator-pattern.svg)](https://hub.docker.com/r/devopscorner/golang-operator-pattern/)
![download all](https://img.shields.io/github/downloads/devopscorner/golang-operator-pattern/total.svg)
![download latest](https://img.shields.io/github/downloads/devopscorner/golang-operator-pattern/1.1.4/total)
![view](https://views.whatilearened.today/views/github/devopscorner/golang-operator-pattern.svg)
![clone](https://img.shields.io/badge/dynamic/json?color=success&label=clone&query=count&url=https://github.com/devopscorner/golang-operator-pattern/blob/master/clone.json?raw=True&logo=github)
[![issues](https://img.shields.io/github/issues/devopscorner/golang-operator-pattern)](https://github.com/devopscorner/golang-operator-pattern/issues)
[![pull requests](https://img.shields.io/github/issues-pr/devopscorner/golang-operator-pattern)](https://github.com/devopscorner/golang-operator-pattern/pulls)
[![forks](https://img.shields.io/github/forks/devopscorner/golang-operator-pattern)](https://github.com/devopscorner/golang-operator-pattern/fork)
[![stars](https://img.shields.io/github/stars/devopscorner/golang-operator-pattern)](https://github.com/devopscorner/golang-operator-pattern/stargazers)
[![license](https://img.shields.io/github/license/devopscorner/golang-operator-pattern)](https://img.shields.io/github/license/devopscorner/golang-operator-pattern)

## Description

AWS Community Day 2024 Jakarta --- Building RESTful API in Golang using Kubernetes Operator Pattern for Amazon EKS 1.30

## Getting Started

### Prerequisites

- go version v1.22.0+
- docker version 17.03+.
- kubectl version v1.11.3+.
- Access to a Kubernetes v1.11.3+ cluster.

### Installation `Operator-SDK`

- Install `operator-sdk` binary

  ```
  brew install operator-sdk
  ```

- Download release binary

  Set platform information:

  ```
  export ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
  export OS=$(uname | awk '{print tolower($0)}')
  ```

  Download binary for your platform:

  ```
  export OPERATOR_SDK_DL_URL=https://github.com/operator-framework/operator-sdk/releases/download/v1.38.0
  curl -LO ${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}
  ```

- Compile `operator-sdk` from source

  ```
  git clone https://github.com/operator-framework/operator-sdk
  cd operator-sdk
  git checkout master
  make install
  ```

### Running `Operator-SDK`

- Init `operator-sdk`

  ```
  operator-sdk init \
    --domain awscb.id \
    --repo github.com/devopscorner/golang-operator-pattern \
    --plugins=go.kubebuilder.io/v4
  ```

- Setup for multigroup API

  ```
  kubebuilder edit --multigroup=true
  ```

- Create API Resource with `operator-sdk`

  ```
  operator-sdk create api \
    --group product \
    --version v1 \
    --kind Product \
    --resource \
    --controller

  operator-sdk create api \
    --group product \
    --version v1 \
    --kind Order \
    --resource \
    --controller

  operator-sdk create api \
    --group auth \
    --version v1 \
    --kind Login \
    --resource \
    --controller

  operator-sdk create api \
    --group auth \
    --version v1 \
    --kind User \
    --resource \
    --controller
  ```

### Integration Your MVC+R with `Operator-SDK`

- Folder Structure

  ```
  .
  ├── api/v1/
  │   └── restapi_types.go
  ├── controllers/
  │   ├── api_controller.go
  │   ├── login_controller.go
  │   ├── order_controller.go
  │   ├── product_controller.go
  │   └── user_controller.go
  ├── internal/
  │   ├── model/
  │   │   ├── user.go
  │   │   ├── order.go
  │   │   └── product.go
  │   ├── repository/
  │   │   ├── api_repository.go
  │   │   ├── login_repository.go
  │   │   ├── order_repository.go
  │   │   ├── product_repository.go
  │   │   └── user_repository.go
  │   ├── service/
  │   │   ├── login_service.go
  │   │   ├── order_service.go
  │   │   ├── product_service.go
  │   │   └── user_service.go
  │   ├── view/
  │   │   ├── login_view.go
  │   │   ├── order_view.go
  │   │   ├── product_view.go
  │   │   └── user_view.go
  ├── cmd/manager/
  │   └── main.go
  └── pkg/database/
      ├── gorm.go
      ├── mysql.go
      ├── postgresql.go
      └── sqlite.go
  ```

- Modified `restapi_types.go` Struct
- Add more MVC+R source code as shown folder structure
- Refresh dependencies go
  ```
  go mod tidy
  ```

### Prometheus Metrics (CRD)

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install prometheus-operator-crd prometheus-community/prometheus-operator-crds \
    --create-namespace -n <some-namespace>
```

### To Deploy on the cluster

**Build and push your image to the location specified by `IMG`:**

```sh
make docker-build docker-push IMG=<some-registry>/src:tag
```

> **NOTE:** This image ought to be published in the personal registry you specified.
> And it is required to have access to pull the image from the working environment.
> Make sure you have the proper permission to the registry if the above commands don’t work.

**Install the CRDs into the cluster:**

```sh
make install
```

**Deploy the Manager to the cluster with the image specified by `IMG`:**

```sh
make deploy IMG=<some-registry>/src:tag
```

> **NOTE**: If you encounter RBAC errors, you may need to grant yourself cluster-admin
> privileges or be logged in as admin.

**Create instances of your solution**
You can apply the samples (examples) from the config/sample:

```sh
kubectl apply -k config/samples/
```

> **NOTE**: Ensure that the samples has default values to test it out.

### To Uninstall

**Delete the instances (CRs) from the cluster:**

```sh
kubectl delete -k config/samples/
```

**Delete the APIs(CRDs) from the cluster:**

```sh
make uninstall
```

**UnDeploy the controller from the cluster:**

```sh
make undeploy
```

## Project Distribution

Following are the steps to build the installer and distribute this project to users.

1. Build the installer for the image built and published in the registry:

```sh
make build-installer IMG=<some-registry>/src:tag
```

> NOTE: The makefile target mentioned above generates an 'install.yaml'
> file in the dist directory. This file contains all the resources built
> with Kustomize, which are necessary to install this project without
> its dependencies.

2. Using the installer

Users can just run kubectl apply -f <URL for YAML BUNDLE> to install the project, i.e.:

```sh
kubectl apply -f https://raw.githubusercontent.com/<org>/src/<tag or branch>/dist/install.yaml
```

## Contributing

> **NOTE:** Run `make help` for more information on all potential `make` targets

More information can be found via the [Kubebuilder Documentation](https://book.kubebuilder.io/introduction.html)

## Security Check

Make sure that you didn't push sensitive information in this repository

- [ ] AWS Credentials (AWS_ACCESS_KEY, AWS_SECRET_KEY)
- [ ] AWS Account ID
- [ ] AWS Resources ARN
- [ ] Username & Password
- [ ] Private (id_rsa) & Public Key (id_rsa.pub)
- [ ] DNS Zone ID
- [ ] APP & API Key

## License

Copyright 2024-2025 DevOpsCorner Indonesia (devopscorner.id)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

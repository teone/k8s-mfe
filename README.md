# Micro Frontend Test

In order to run this example in development mode:

```shell
cd app1; npm start
cd container; npm start
```

## Test production mode

> Requires a K8s cluster

Let's start building the code and the required containers:

```shell
npm run build:all
npm run build:all:docker
```

Install the helm-chart:
```shell
helm upgrade --install mfe ./deployment/mfe
```
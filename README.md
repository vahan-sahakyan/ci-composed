## Code Inspect 📦 Docker Composed

### External Repository Links

- [Frontend](https://github.com/vahan-sahakyan/code-inspect-frontend)
- [Backend](https://github.com/vahan-sahakyan/code-inspect-backend)

### Get Started

#### 0. Prerequisites

- docker
- minikube
- kubectl

#### 1. Run with kubernetes

1. clone the repo

```bash
git clone https://github.com/vahan-sahakyan/ci-composed.git && cd ci-composed
```

2. run minikube

```bash
minikube start
```

3. clone sub repos

```bash
make clone
```

4. apply k8s deployments

```bash
make k8s_start
```

5. open a minikube tunnel for localhost ingress

```bash
sudo minikube tunnel
```

6. open the app on localhost

```bash
http://localhost/login
```

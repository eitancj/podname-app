# Display K8s Pod Names with Nginx Containers
\
![](https://github.com/eitancj/preview_images/blob/main/podname.png?raw=true)

\
Deploy a kubernetes web app that displays the name of each pod in the replica set.

### Tested Tech Stack
- nginx 1.25.2 on Alpine 3.18-slim
- kubernetes v1.25.2
- docker desktop 4.15.0
- macOS X

### Prerequisites
- Docker Desktop with Kubernetes enabled
- Mac\Linux machine


### Run Programme
1. Clone repo & cd into local copy

2. Create a new namespace as an isolated sandbox for this session.
```sh
kubectl create namespace podname-ns
```

3. Build the app image.
```sh
docker build -t podname:v1.0 .
```

4. Deploy the pods.
> Will spin up 4 pods by default; edit the deployment yaml to adjust replicas. 
```sh
kubectl apply -f podname-dep.yml -n podname-ns
```

5. Deploy the service that will point to the pods.
```sh
kubectl apply -f podname-svc.yml -n podname-ns
```

6. Run app using your browser
```sh
open http://localhost:32123
```

7. Switch between pod names.
```sh
# Either hard-refresh you browser
OR
# Watch the pod names alternate every 2 seconds using curl
watch curl http://localhost:32123
```

### Cleanup
1. Delete the podname-app namespace and all its resources along with it.
```sh
kubectl delete ns podname-ns
```
2. Remove the docker images we've created at the beginning of the session.
```sh
docker rmi podname:v1.0
```
3. Delete the cloned repo if you wish.
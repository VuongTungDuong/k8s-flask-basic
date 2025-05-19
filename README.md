
# Nếu dùng minikube thì cần vào gõ lệnh sau để docker chạy trong môi trường của minikuber

```bash
eval $(minikube docker-env)
```

# Build image

```bash
docker build --tag flask-app:latest .
```

# Apply Image bằng kubernestes

```bash
kubectl apply -f flask-app.yaml
```

# Khi cần thay đổi image thì xóa đi và chạy lại ( cảch thô sở, cách khác là build là một bản có tag khác và apply tag đó vào để được chạy lại)

Cách 1

```bash
kubectl delete deployment flask-app            
kubectl delete service flask-app-service
kubectl apply -f flask-app.yaml
```

Cách 2:

Build lại docker image với một tag khác

```bash
docker build --tag flask-app:v1 .
```

Sửa file flask-app.yaml theo image mới và chạy

```base
kubectl apply -f flask-app.yaml 
```

# Tim IP để vào khi dùng minikube

```bash
minikube service list
```

ví dụ

```bash

➜  k8s minikube service list 
|-------------|-------------------|--------------|---------------------------|
|  NAMESPACE  |       NAME        | TARGET PORT  |            URL            |
|-------------|-------------------|--------------|---------------------------|
| default     | flask-app-service |           80 | http://192.168.49.2:30080 |
| default     | flink-jobmanager  | No node port |                           |
| default     | kubernetes        | No node port |                           |
| kube-system | kube-dns          | No node port |                           |
|-------------|-------------------|--------------|---------------------------|
```

Đây là IP của bản để  vào Flash app `http://192.168.49.2:30080`

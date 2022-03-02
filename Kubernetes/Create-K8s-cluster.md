### Setup a kubernetes cluster with kubeadam

1.Initialize Kubernetes Cluster
   ```
   sudo kubeadm init --pod-network-cidr=192.168.0.0/16  --apiserver-advertise-address=10.66.13.81

   ```

2.config

```
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

```

3.Installing Pod Network using Calico network

```
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 
```

4.Join Worker Nodes (tapid in the worker node)

```kubeadm join 10.66.13.81:6443 --token xxxx.xxxxxxxxxxx 
	--discovery-token-ca-cert-hash sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
```




### test the cluster
```
 kubectl apply -f https://k8s.io/examples/service/load-balancer-example.yaml

 kubectl expose deployment hello-world --type=LoadBalancer --name=my-service
 ```

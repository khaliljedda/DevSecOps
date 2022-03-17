# Create LoadBalancer with metalLab
### Configuring Metal LoadBalancer 
``` kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.7.3/manifests/metallb.yaml ```

``` kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
```
### First time when you install the metallb you will see this error, in order to fix it you need to create the secret. The memberlist secret contains the secretkey to encrypt the communication between speakers for the fast dead node detection.

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
secret/memberlist created

### create the config map
``` kubectl apply -f LoadBalancer/configmaplb.yaml ```

### ressources:

1.https://devopslearning.medium.com/metallb-load-balancer-for-bare-metal-kubernetes-43686aa0724f
2.https://collabnix.com/3-node-kubernetes-cluster-on-bare-metal-system-in-5-minutes/
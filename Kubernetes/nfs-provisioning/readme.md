### create the NFS server
sudo mkdir /srv/nfs/kubedata -p
sudo chown userpfe: /srv/nfs/kubedata/
Sudo yum install -y NFS-utils
sudo systemctl enable NFS-server
sudo nano /etc/exports
add this line => /srv/nfs/kubedata *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
sudo exportfs -rav
sudo exportfs -v
##### test the nfs server
sudo mount -t nfs 10.66.13.81:/srv/nfs/kubedata /mnt (to the worker node to test the mount)

### create the nfs-client-provisioning
kubectl create -f rbac.yaml
kubectl create -f class.yaml
kubectl create -f deployment.yaml

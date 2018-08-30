
imageId=$(openstack image list | grep "Fedora Atomic 26" |  awk '{print $2}')
magnum cluster-template-create k8s-template \
    --image $imageId \
    --external-network public \
    --flavor cpu1-ram2048-disk20 \
    --master-flavor cpu1-ram2048-disk20 \
    --docker-volume-size 5 \
    --network-driver flannel \
    --volume-driver cinder \
    --coe kubernetes 
magnum cluster-create k8s-cluster01 \
    --cluster-template k8s-template \
    --master-count 1 \
    --node-count 3 \
    --keypair tlija-key

ID=$(cinder create --display-name=demo-mongodb 1 | awk -F'|' '$2~/^[[:space:]]*id/ {print $3}')

kubectl create -f k8-node-mongo/mongo-controller.yaml
kubectl create -f k8-node-mongo/mongo-service.yaml
kubectl create -f k8-node-mongo/web-controller-demo.yaml
kubectl create -f k8-node-mongo/web-service.yaml

FLOATING_ID=$(openstack floating ip create public -f value -c id)
neutron lbaas-loadbalancer-list
PORT_ID=$(neutron lbaas-loadbalancer-show a205ccb8-17d5-4024-8a68-522c6f65f95a | grep vip_port_id  | awk '{print $4}')
neutron floatingip-associate $FLOATING_ID $PORT_ID

neutron security-group-create lb-web
neutron security-group-rule-create \
  --direction ingress \
  --protocol tcp \
  --port-range-min 80 \
  --port-range-max 80 \
  --remote-ip-prefix 0.0.0.0/0 \
  lb-web
neutron port-update --security-group lb-web $PORT_ID
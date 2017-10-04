magnum cluster-template-create k8s-cluster-template \
    --image 25341c5e-9c0c-43bf-b92c-3ce6d009e4d4 \
    --external-network internetlan \
    --dns-nameserver 194.47.199.41 \
    --flavor 12020 \
    --master-flavor 12020 \
    --docker-volume-size 5 \
    --network-driver flannel \
    --volume-driver cinder \
    --coe kubernetes 
magnum cluster-create k8s-cluster \
    --cluster-template k8s-cluster-template \
    --master-count 1 \
    --node-count 2 \
    --keypair mykey

ID=$(cinder create --display-name=demo-mongodb 1 | awk -F'|' '$2~/^[[:space:]]*id/ {print $3}')

kubectl create -f k8-node-mongo/mongo-controller.yaml

neutron floatingip-create internetlan
FLOATING_ID=$(neutron floatingip-list | grep "194.47.164.26" | awk '{print $2}')
neutron lbaas-loadbalancer-list
PORT_ID=$(neutron lbaas-loadbalancer-show 22fe2af5-d13f-42ff-9aa1-f1a954e5c11e | grep vip_port_id  | awk '{print $4}')
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
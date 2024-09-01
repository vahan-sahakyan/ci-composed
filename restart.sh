kubectl scale deployment backend --replicas=0
kubectl scale deployment backend --replicas=1

kubectl scale deployment frontend --replicas=0
kubectl scale deployment frontend --replicas=1

kubectl scale deployment ws-server --replicas=0
kubectl scale deployment ws-server --replicas=1

kubectl scale deployment zookeeper --replicas=0
kubectl scale deployment zookeeper --replicas=1

kubectl scale deployment kafka --replicas=0
kubectl scale deployment kafka --replicas=1
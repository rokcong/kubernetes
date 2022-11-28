#!/bin/bash

loop() {
cd /test
kubectl create -f test.yml
sleep 1
ip addr show kube-ipvs0 | tail -2 | head -1 | awk '{print $2}' >> ip.txt
kubectl delete -f test.yml
sleep 0.5
}

> /test/ip.txt
for i in $(seq 5)
do
	echo "[Number]: $i"
	loop >/dev/null 2>&1
done
cat /test/ip.txt

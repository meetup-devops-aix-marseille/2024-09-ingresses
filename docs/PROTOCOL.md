# PROTOCOL

## cluster

- managed cluster 1.25 on OVH managed k8s (GRA11)
- 2 nodes for usual workloads + 2 dedicated nodes for ingress-controller
- victoria-metrics for collecting data

## ingress controllers

- 1 CPU / 1 Go RAM guaranted
- topology repartition via nodeSelector and taint/toleration

## ingresses

- We are interested by the time taken to create the ingress and certificates (in case of tls enabled ones) but not on the performance of serving the web pages itself
- We create beetween 10,100,1000,10000 ingresses depending on how far we can go

## parameters

- ingress admission webhook (on/off)
- ingress service-upstream or not
- specific annotations used or not
- tls enabled or not (through cert-manager)

and of course the ingress controller itself

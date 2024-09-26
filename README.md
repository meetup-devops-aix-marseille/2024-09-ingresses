# ingresses labs

## preparation

### generate ingresses templates

```shell
for i in $(seq 0 10 9);    do ./scripts/mk-ingresses.sh ingressss-notls-10   ./templates/03-apisix/_no-tls.yaml $i 10; done
for i in $(seq 0 10 99);   do ./scripts/mk-ingresses.sh ingressss-notls-100  ./templates/03-apisix/_no-tls.yaml $i 10; done
for i in $(seq 0 10 999);  do ./scripts/mk-ingresses.sh ingressss-notls-1000 ./templates/03-apisix/_no-tls.yaml $i 10; done
for i in $(seq 0 10 9999); do ./scripts/mk-ingresses.sh ingressss-notls-1000 ./templates/03-apisix/_no-tls.yaml $i 10; done
```

### create a cluster

- k8s 1.29+
- 2 pools with 2x (4 CPUs / 8 Go) nodes minimum : ingress-node and workers
- deploy cert-manager: `./scripts/setup-cert-manager.sh`
- deploy the following from helpers scrips in `./scripts`:
  - prometheus crds
  - victoria-metrics: `./scripts/setup-victoria-metrics.sh`
  - echo-server: `./scripts/setup-echo-server.sh`
  - additionnal tools like ovh-mks-exporter

### bench your ingress controller

- deploy you ingress controller: `./scripts/setup-ingress-nginx.sh`
- deploy ingresses : `make ingress TYPE=notls NB=10 IC=01-ingress-nginx`
- verify: `make count`
- check metrics in grafana
- cleanup : make clean

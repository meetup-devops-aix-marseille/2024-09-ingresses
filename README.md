# ingress labs

```shell
for i in $(seq 0 10 9); do ./scripts/mk-ingresses.sh ingressss-notls-10 ./templates/03-apisix/_no-tls.yaml $i 10; done
for i in $(seq 0 10 99); do ./scripts/mk-ingresses.sh ingressss-notls-100 ./templates/03-apisix/_no-tls.yaml $i 10; done
for i in $(seq 0 10 999); do ./scripts/mk-ingresses.sh ingressss-notls-1000 ./templates/03-apisix/_no-tls.yaml $i 10; done
```

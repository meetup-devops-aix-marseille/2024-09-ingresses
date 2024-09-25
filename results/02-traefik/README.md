# traefik

## protocol

See [details](../../docs/PROTOCOL.md)

## configuration

Check [values](../../values/traefik.yaml)

## basic cumsumption

![basic](basic.png)

## no TLS / 10

- time: 1 sec
- rate: 10 ingress/sec

![notls-10](notls-10.png)

## no TLS / 100

- time: 12 sec
- rate: 8,33 ingress/sec

![notls-100](notls-100.png)

## no TLS / 1000

- time: 106 sec
- rate: 9,43 ingress/sec

![notls-1000](notls-1000.png)

## no TLS / 10000

- time: 1068 sec
- rate: 9,36 ingress/sec

![notls-10000](notls-10000.png)

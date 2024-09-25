IC := "01-ingress-nginx"
TYPE := "notls"
NB := "10"

clean:
	@kubectl get ingress  -n echo-server --no-headers \
		| grep 'ingressss' \
		| awk '{ print $$1 }' \
		| parallel -j 10 --progress kubectl -n echo-server delete ingress --wait=false {} > /dev/null

count:
	@kubectl get ingress -n echo-server --no-headers \
		| grep 'ingressss' \
		| wc -l

ingress:
	@date "+%Y-%m-%d %H:%M:%S"
	@find manifests/${IC}/ingressss-${TYPE}-${NB}/ -type f \
		| parallel -j 10 kubectl -n echo-server apply --validate=false -f {} > /dev/null
	@date "+%Y-%m-%d %H:%M:%S"

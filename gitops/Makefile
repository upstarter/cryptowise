ZIPKIN_POD_NAME=$(shell kubectl -n istio-system get-pod -l app=zipkin -o jsonpath='{.items[0].metadata.name}')
SERVICEGRAPH_POD_NAME=$(shell kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}')
GRAFANA_POD_NAME=$(shell kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}')
INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

deploy:
	kubectl apply -f ./kube/services.yaml
	kubectl apply -f ./kube/services-ingress.yaml
deploy-info:
	kubectl get pods && kubetcl get svc && kubectl get ingress
egress:
	istioctl create -f ./istio/networking/egress.yaml
route:
	istioctl create -f ./istio/networking/routing.yaml
retry:
	istioctl replace -f ./istio/networking/routing-retries.yaml

start-monitoring-services:
	$(shell kubectl -n isio-system port-forward $(ZIPKIN_POD_NAME) 9411:9411 & kubectl -n istio-system port-forward
	 (SERVICEGRAPH_POD_NAME) 8088:8088 & kubectl -n istio-system port-forward $(GRAFANA_POD_NAME) 3010:3010)

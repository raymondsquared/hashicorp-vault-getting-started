.PHONY: run-k8s
run-k8s:
	minikube start --driver=docker

.PHONY: k8s-list
k8s-list:
	kubectl config get-clusters

.PHONY: stop-k8s
stop-k8s:
	minikube stop

.PHONY: pre-install-vault
pre-install-vault:
	helm repo add hashicorp https://helm.releases.hashicorp.com

.PHONY: install-vault
install-vault:
	helm install vault hashicorp/vault --values helm-vault-raft-values.yaml

.PHONY: unseal-vaults
unseal-vaults:
	./unseal-vaults.sh

.PHONY: run-vault
run-vault: unseal-vaults

.PHONY: create-secrets
create-secrets:
	./create-secrets.sh

.PHONY: enable-k8s-authn
enable-k8s-authn:
	./k8s-auth.sh

.PHONY: run-vault-ui
run-vault-ui: 
	kubectl port-forward vault-0 8200:8200

.PHONY: install-app
install-app:
	kubectl apply --filename deployment-01-webapp.yaml

.PHONY: run-app
run-app:
	./run-app.sh

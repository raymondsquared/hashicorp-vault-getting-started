#!/bin/bash

kubectl exec --stdin=true --tty=true vault-0 -- /bin/sh <<EOF

vault auth enable kubernetes

# Use escape character \ before using pod environment variable
vault write auth/kubernetes/config kubernetes_host="https://\$KUBERNETES_PORT_443_TCP_ADDR:443"

vault policy write webapp - <<INNER
path "secret/data/webapp/config" {
  capabilities = ["read"]
}
INNER

vault write auth/kubernetes/role/webapp \
  bound_service_account_names=vault \
  bound_service_account_namespaces=default \
  policies=webapp \
  ttl=24h

exit

EOF

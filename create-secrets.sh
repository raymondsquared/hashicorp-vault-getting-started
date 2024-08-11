#!/bin/bash

VAULT_TOKEN=$(jq -r ".root_token" cluster-keys.json)

kubectl exec --stdin=true --tty=true vault-0 -- /bin/sh <<EOF

vault login $VAULT_TOKEN

vault secrets enable -path=secret kv-v2

vault kv put secret/webapp/config username="static-user" password="static-password"

vault kv get secret/webapp/config

exit

EOF

# hashicorp-vault-getting-started

Secure, store, and tightly control access to tokens, passwords, certificates, and encryption keys for protecting secrets and other sensitive data using a UI, CLI, or HTTP API.

https://www.vaultproject.io/

https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-minikube-raft

[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/mit)

Running Vault on Kubernetes is generally the same as running it anywhere else. Kubernetes, as a container orchestration engine, eases some of the operational burdens and Helm charts provide the benefit of a refined interface when it comes to deploying Vault in a variety of different modes.

In this tutorial, you will set up Vault and its dependencies with a Helm chart. You will then integrate a web application that uses the Kubernetes service account token to authenticate with Vault and retrieve a secret.

## 🚀 Features

- **Vault**: HashiCorp Vault is a centralized secrets management tool that securely stores, manages, and controls access to sensitive data like API keys, passwords, and encryption keys.

## 🧰 Prerequisites

- Minikube
- Helm

## 🛠 Installation

```bash
# Install dependencies
make install
```

## 📚 Usage

### App Commands

```bash
make run-k8s                            # Start the kubernetes (minikube)
make install-vault                      # Install HashiCorp Vault
make run-vault                          # Run HashiCorp Vault
make create-secrets                     # Create secrets in vault
make enable-k8s-authn                   # Configure vault to interact with k8s

make run-vault-ui                       # Run HashiCorp Vault UI

make install-app                        # Install web application
make run-app                            # Run web application
```

### Check Web Application

The Vault UI is enabled but NOT exposed as service for security reasons. The Vault UI can also be exposed via port-forwarding or through a ui configuration value.

```
http://localhost:8200
```

### Check Web Application

In the original terminal, perform a curl request at http://localhost:8080.

```
curl http://localhost:8080
```

## 🤝 Contributing

We welcome contributions to Kubernetes Deployment Strategy! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to submit pull requests, report issues, and suggest improvements.

## 📜 License

This repo is open-source software licensed under the [MIT license](http://www.apache.org/licenses/mit).

## 🙏 Acknowledgements

- [Kubernetes](https://kubernetes.io/) for the amazing framework
- [HashiCorp Vault](https://developer.hashicorp.com/vault) also for the amazing framework
- All our contributors and supporters!

---

Made with ❤️ by the raymondsquared. Happy coding!

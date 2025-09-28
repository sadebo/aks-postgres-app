# AKS + Postgres Operator + Flask App (Terraform + GitHub Actions)

This project provisions an **AKS cluster with Postgres Operator** and deploys a sample **Flask app** with a Postgres database using **Terraform** and **GitHub Actions**.  
It uses **Azure Container Registry (ACR)** for images and a **remote state backend** (Azure Storage Account).

---

## 📂 Project Structure

├── bootstrap/ # Remote state backend setup
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── terraform/ # AKS + ACR infrastructure
│ ├── backend.tf
│ ├── provider.tf
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── app/ # Flask app
│ ├── app.py
│ ├── requirements.txt
│ └── Dockerfile
├── k8s/ # Kubernetes manifests (Kustomize)
│ ├── base/
│ └── overlays/{dev,test,prod}/
└── .github/workflows/ # GitHub Actions pipelines
├── deploy.yml
└── destroy.yml



---

## ⚙️ Prerequisites

1. **Azure Subscription** (Free tier works with $200 credits).
2. **Azure CLI** installed locally.
3. **Terraform CLI** (≥ 1.5).
4. **GitHub Repository** for CI/CD.

---

## 🔑 Service Principal Setup

Create a Service Principal for GitHub Actions:

```bash
az ad sp create-for-rbac \
  --name "gh-aks-sp" \
  --role Contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID> \
  --sdk-auth

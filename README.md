# AKS + Postgres Operator + Flask App (GitHub Actions)

This project provisions an **AKS cluster on Azure** using **Terraform**, deploys a **Postgres Operator + Postgres cluster**, and a simple **Flask app** connected to the database. All deployments are automated via **GitHub Actions**.

---

## 🚀 Architecture

```mermaid
flowchart TD
    A[GitHub Actions] -->|Terraform Apply| B[Azure Resource Group]
    B --> C[AKS Cluster]
    C --> D[Postgres Operator]
    D --> E[Postgres DB Cluster]
    C --> F[Flask App Deployment]
    F -->|Queries| E
    C --> G[Service (LoadBalancer)]
    G -->|External IP| H[User Browser]


... IronKube – DevSecOps Pipeline on AWS EKS

> A complete, production-ready DevSecOps pipeline built from scratch using Terraform, GitHub Actions, Docker, Kubernetes, and AWS EKS.

![CI Pipeline](https://github.com/emk420/ironkube-project/actions/workflows/ci.yml/badge.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/emk420/ironkube-project)
![GitHub repo size](https://img.shields.io/github/repo-size/emk420/ironkube-project)
![Docker Pulls](https://img.shields.io/docker/pulls/emk247/ironkube-inventory)
![License](https://img.shields.io/github/license/emk420/ironkube-project)

---

## 📌 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Tech Stack](#tech-stack)
- [Features](#features)
- [Commit Security](#commit-security)
- [Getting Started](#getting-started)
- [API Endpoints](#api-endpoints)
- [CI/CD Pipeline](#cicd-pipeline)
- [Local Development](#local-development)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

---

## 📖 Overview

**IronKube** is a hands-on DevSecOps project that demonstrates how to build, secure, and deploy a containerized application to Kubernetes on AWS.

The project includes:
- A Python Flask inventory API
- Docker containerization
- GitHub Actions CI/CD pipeline with security scanning
- Infrastructure as Code (Terraform) for AWS EKS
- Kubernetes deployment with LoadBalancer
- GitOps-ready structure (ArgoCD compatible)

This project is designed to showcase real-world DevOps skills: automation, security, infrastructure as code, and cloud-native deployment.

---

## 🧱 Architecture

┌─────────────────────────────────────────────────────────────────────┐
│ IRONKUBE PIPELINE │
├─────────────────────────────────────────────────────────────────────┤
│ │
│ [Developer] │
│ │ │
│ ▼ │
│ [GitHub] ──► [GitHub Actions] ──► [Docker Build] ──► [Trivy Scan]│
│ │ │
│ ▼ │
│ [Amazon ECR] (Container Registry) │
│ │ │
│ ▼ │
│ [Amazon EKS] (Kubernetes Cluster) │
│ │ │
│ ▼ │
│ [Frontend Pod] ──► [LoadBalancer] ──► [Internet] │
│ │
└─────────────────────────────────────────────────────────────────────┘
text


---

## 🛠️ Tech Stack

| Category | Tools |
|----------|-------|
| **Cloud** | AWS (EKS, ECR, VPC, IAM, LoadBalancer) |
| **IaC** | Terraform |
| **CI/CD** | GitHub Actions |
| **Container** | Docker, Kubernetes |
| **Security** | Trivy, GPG, Pre-commit (gitleaks) |
| **Scripting** | Python (Flask), Bash |
| **Local Dev** | WSL2, Minikube, Kind |

---

## ✨ Features

- ✅ CI/CD Pipeline with GitHub Actions
- ✅ Vulnerability Scanning (Trivy) – 0 CVEs
- ✅ Infrastructure as Code (Terraform)
- ✅ AWS EKS Deployment with LoadBalancer
- ✅ GPG-signed commits (cryptographically verified)
- ✅ Pre-commit hooks with gitleaks (blocks secrets)
- ✅ Multi-branch workflow (`main` + `dev`)
- ✅ Inventory API with `/health`, `/inventory`, `/stats`
- ✅ Docker image published to Docker Hub
- ✅ GitOps-ready (ArgoCD compatible)

---

## 🔐 Commit Security

Every commit in this project is secured through multiple layers:

| Security Layer | Tool | What It Does |
|----------------|------|--------------|
| **GPG Signing** | GPG | Cryptographically signs every commit to verify authenticity |
| **Pre-commit Hooks** | pre-commit | Runs checks automatically before each commit |
| **Secret Scanning** | gitleaks | Prevents hardcoded secrets (API keys, passwords) from being committed |
| **Vulnerability Scanning** | Trivy | Scans container images for CVEs before deployment |

### Example Pre-commit Hook Output

```bash
$ git commit -m "test: adding secret"
Detect hardcoded secrets.................................................Failed
- hook id: gitleaks
- exit code: 1
WRN leaks found: 1

Result: The commit is blocked, preventing secrets from ever reaching GitHub.
🚀 Getting Started
Prerequisites

    Docker

    kubectl

    Terraform

    AWS CLI

    Minikube (optional)

Clone the Repository
bash

git clone https://github.com/emk420/ironkube-project.git
cd ironkube-project

📡 API Endpoints
Endpoint	Method	Description	Example Response
/health	GET	Health check	{"status":"healthy"}
/inventory	GET	List all inventory items	{"apple":50,"banana":30,"orange":20}
/stats	GET	Inventory summary	{"total_items":3,"total_quantity":100,"items":{...}}
/ping	GET	Simple ping	{"pong":"ok"}
/version	GET	App version	{"version":"2.0.0","status":"updated"}
🔁 CI/CD Pipeline

The pipeline is defined in .github/workflows/ci.yml:

    Code Checkout – Pulls the latest code

    Docker Build – Builds the container image

    Trivy Scan – Scans for vulnerabilities (fails on CRITICAL)

    Push to ECR – Pushes image to Amazon ECR

    Deploy to EKS – (Optional) Updates Kubernetes deployment

https://github.com/emk420/ironkube-project/actions/workflows/ci.yml/badge.svg
🐳 Local Development
Run with Docker
bash

# Build the image
docker build -t ironkube-inventory:latest .

# Run the container
docker run -d -p 5000:9000 --name ironkube-app ironkube-inventory:latest

# Test
curl http://localhost:5000/health

Run with Docker Compose (Optional)
yaml

version: '3.8'
services:
  app:
    build: .
    ports:
      - "5000:9000"

☁️ Deployment
Deploy to AWS EKS (Terraform)
bash

cd terraform/eks
terraform init
terraform apply -auto-approve

Deploy to Minikube (Local)
bash

minikube start
kubectl create deployment ironkube-app --image=emk247/ironkube-inventory:latest
kubectl expose deployment ironkube-app --type=NodePort --port=5000 --target-port=9000
minikube service ironkube-app --url

📁 Project Structure
text

ironkube-project/
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI/CD
├── terraform/
│   └── eks/
│       ├── main.tf             # EKS cluster
│       ├── vpc.tf              # Networking
│       ├── nodegroup.tf        # Worker nodes
│       └── outputs.tf
├── app.py                      # Flask API
├── Dockerfile                  # Container definition
├── requirements.txt            # Python dependencies
├── README.md                   # You are here
└── LICENSE

🤝 Contributing

    Fork the repo

    Create a feature branch (git checkout -b feature/amazing-feature)

    Commit your changes (git commit -m 'feat: add amazing feature')

    Push to the branch (git push origin feature/amazing-feature)

    Open a Pull Request

📄 License

This project is licensed under the MIT License – see the LICENSE file for details.
🙌 Acknowledgements

    Flask

    Terraform

    AWS EKS

    Trivy

    GitHub Actions

📬 Contact

Kelly Eyole Mbua
GitHub
LinkedIn
Email 

⭐ If you found this project useful, please give it a star! ⭐

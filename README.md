# Production-Grade Observability Stack (Prometheus, Grafana, OpenTelemetry, Jaeger) for a Python Application on AWS EKS 

(A fully automated cloud-native deployment of a Python Log Analyzer app running on Kubernetes using AWS Elastic Kubernetes Service (EKS). Automated with Terraform, Docker, and CI/CD pipeline using GitHub Actions.)

This project demonstrates a production-grade observability stack (Prometheus, Grafana, OpenTelemetry and Jaeger) for a Python application deployed on AWS Elastic Kubernetes Service (EKS). The project further demonstrates how modern DevOps workflow with Infrastructure as Code, CI/CD automation, containerization, and Kubernetes orchestration combined with observability.

---

## Architecture Overview

The application is deployed using a fully automated pipeline:

Developer Push → GitHub → CI/CD → Docker → Amazon ECR → Terraform → AWS EKS → Kubernetes Pods → ALB → Users



### Key Components

- **Terraform** – Infrastructure provisioning
- **GitHub Actions** – CI/CD pipeline
- **Docker** – Containerized Python application
- **Amazon ECR** – Container registry
- **Amazon EKS** – Kubernetes cluster
- **Amazon RDS (PostgreSQL)** – Database for storing log results
- **Application Load Balancer (ALB)** – External traffic routing
- **Amazon CloudWatch** – Logging and monitoring
- **S3 Remote State + DynamoDB Locking** – Terraform state management

---

## Architecture Diagram

![Automated EKS Deployment](architecture/diagram.png)

---

## Application Overview (Summary)

The **Python Log Analyzer API** processes log files and extracts useful insights such as:

- Error frequency
- Top IP addresses
- Status code distribution
- Suspicious activity patterns

---

## Infrastructure Provisioning (Terraform + Helm)

Terraform provisions the following AWS resources:

- VPC and networking
- Amazon EKS cluster
- IAM roles and policies
- Amazon RDS PostgreSQL database
- Application Load Balancer
- Security groups
- CloudWatch (for monitoring & Observability)

### Terraform Backend

Remote state management:

- **Amazon S3** – Terraform state storage
- **DynamoDB** – State locking

---

## CI/CD Pipeline

The CI/CD pipeline is implemented using **GitHub Actions**.

Pipeline steps:

1. Code pushed to GitHub
2. Build Docker image
3. Push image to Amazon ECR
4. Run Terraform apply
5. Deploy application to Kubernetes
  
---

## Kubernetes Deployment

The application is deployed using Kubernetes manifests.

### Deployment

kubectl apply -f k8s/deployment.yaml


### Service
kubectl apply -f k8s/service.yaml

### Ingress
kubectl apply -f k8s/ingress.yaml


---

## Traffic Flow

User → Application Load Balancer → Kubernetes Ingress → Service → Pods → PostgreSQL Database

---

## Monitoring and Observability
The project implements distributed tracing with OpenTelemetry and Jaeger for microservices visibility.  Custom Grafana dashboards have been designed and incorporated for real-time system monitoring. Observability has also been integrated into CI/CD pipelines (GitHub Actions)


- **Amazon CloudWatch Logs**
- Container logs from EKS
- ALB access logs

This allows tracking:

- API request logs
- Kubernetes pod logs
- infrastructure metrics

---


## Key DevOps Concepts Demonstrated

- Infrastructure as Code
- Kubernetes container orchestration
- CI/CD automation
- Immutable infrastructure
- Cloud-native application deployment
- Observability and monitoring

---

## Author - Eric Paatey

I built this project as part of my **DevOps Build Lab**, a series of my hands-on cloud engineering projects focused on real-world infrastructure automation.


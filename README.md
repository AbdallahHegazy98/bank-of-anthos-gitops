# Bank of Anthos - End-to-End Cloud Native DevOps Journey

![Bank of Anthos](https://github.com/GoogleCloudPlatform/bank-of-anthos)

## Project Overview

This project represents my journey of taking a complete cloud-native microservices application and transforming it from a local development environment into a production-style Kubernetes deployment running on AWS EKS.

I started with a large-scale microservices application, learned how each component communicates, containerized the workloads, orchestrated them with Kubernetes, automated the infrastructure using Terraform, implemented CI/CD pipelines, introduced GitOps practices using ArgoCD, added observability with monitoring tools, and finally optimized the environment for scalability and reliability.

The goal of this project was not only to deploy an application, but to understand how modern DevOps teams build, automate, monitor, and operate cloud-native systems.

---

# 🏗️ Project Architecture Evolution

The project was built progressively through multiple stages:


---

# Phase 1 - Understanding and Running Bank of Anthos Locally

## Application Overview

I started by exploring the Bank of Anthos project, a realistic microservices application originally developed by Google.

The application contains multiple services communicating together:

- Frontend service
- Backend services
- Account service
- Transaction history service
- Balance reader service
- Database components
- Messaging components

The first challenge was understanding:

- How microservices communicate
- Service dependencies
- Configuration management
- Networking between components
- Application lifecycle


## Local Deployment

I deployed the application locally using Kubernetes.

During this phase I applied:

- Kubernetes manifests
- Pods
- Deployments
- Services
- ConfigMaps
- Secrets
- Namespaces
- Internal networking

I verified that all services were healthy and communicating correctly before moving toward cloud deployment.

# Phase 2 - Containerization

After understanding the application structure, I moved toward container-based deployment.

## Containerization Goals

The objective was to make every component:

- Portable
- Reproducible
- Independently deployable
- Kubernetes-ready

## Docker Improvements

During this stage I worked with:

- Docker images
- Docker containers
- Image optimization
- Container networking
- Environment variables
- Container troubleshooting


I validated containers individually before allowing Kubernetes to manage them.


# Phase 3 - Kubernetes Orchestration

After containerization, I moved the application into Kubernetes orchestration.

## Kubernetes Implementation

I deployed:

- Deployments
- Services
- Pods
- Configurations
- Secrets
- Persistent components


Kubernetes allowed me to achieve:

✅ Self-healing workloads  
✅ Automated scheduling  
✅ Service discovery  
✅ Declarative infrastructure  
✅ Container lifecycle management  


# Debugging and Troubleshooting Journey

A major part of this project was learning how to debug real-world Kubernetes problems.

I worked through issues involving:

- Pods failing to start
- Image pulling problems
- Incorrect configurations
- Service communication failures
- Resource limitations
- Networking issues
- Authentication problems


My debugging workflow became:

```
Kubernetes Debugging Workflow
=============================


                 Problem Detected
                       |
                       v
              Application Not Working
                       |
                       v
              Check Cluster Status
                       |
                       v
              kubectl cluster-info
              kubectl get nodes
                       |
                       v
              Check All Workloads
                       |
                       v
              kubectl get pods -A
              kubectl get deployments
              kubectl get services
                       |
                       v
              Pod Status Investigation
                       |
        ---------------------------------
        |                               |
        v                               v
   Pod Running                    Pod Failed/Pending
        |                               |
        v                               v
 Check Application Logs          Describe Pod
        |                               |
        v                               v
 kubectl logs <pod>              kubectl describe pod <pod>
        |                               |
        v                               v
 Validate Application             Check Events
 Behavior                         Check Errors
                                        |
                                        v
                         --------------------------------
                         |              |               |
                         v              v               v
                    Image Error    Config Error    Resource Error
                         |              |               |
                         v              v               v
                Check Image       Check ConfigMap   Check CPU/Memory
                Pull Secrets      Check Secrets     Limits
                Registry          Environment       Requests
                         |
                         v
              Fix Configuration
                         |
                         v
              Restart Workload
                         |
                         v
              kubectl rollout restart deployment <name>
                         |
                         v
              Verify Recovery
                         |
                         v
              kubectl get pods
              kubectl logs
              kubectl describe


=====================================================


Service / Networking Debugging
==============================


        Application Cannot Reach Service
                       |
                       v
              Check Service
                       |
                       v
              kubectl get svc
                       |
                       v
              Verify Endpoints
                       |
                       v
              kubectl get endpoints
                       |
                       v
        --------------------------------
        |                              |
        v                              v
    No Endpoints                 Endpoints Exist
        |                              |
        v                              v
 Check Selector Match          Test Connectivity
 Check Labels                  Inside Cluster
        |                              |
        v                              v
 Fix Service Selector          kubectl exec -it <pod> -- sh
                                      |
                                      v
                              curl <service-name>:port


=====================================================


Container Debugging Workflow
============================


             Container Problem
                    |
                    v
             Check Container Status
                    |
                    v
             docker ps
             kubectl get pods
                    |
                    v
             Inspect Logs
                    |
                    v
             kubectl logs <pod>
                    |
                    v
             Enter Container
                    |
                    v
             kubectl exec -it <pod> -- bash
                    |
                    v
        --------------------------------
        |                              |
        v                              v
 Check Files                   Check Environment
 Check Processes               Check Variables
 Check Network                 Check Dependencies
                    |
                    v
             Apply Fix
                    |
                    v
             Redeploy Application


=====================================================


EKS / AWS Debugging Workflow
============================


              EKS Issue
                 |
                 v
        Verify AWS Resources
                 |
                 v
        Check EKS Cluster Status
                 |
                 v
        aws eks describe-cluster
                 |
                 v
        Verify Authentication
                 |
                 v
        aws eks update-kubeconfig
                 |
                 v
        Test Kubernetes Access
                 |
                 v
        kubectl get nodes
                 |
                 v
        Check Node Health
                 |
                 v
        kubectl describe node
                 |
                 v
        Check:
        - IAM Permissions
        - Security Groups
        - Networking
        - Node Capacity
        - Kubernetes Version


=====================================================


Production Debugging Mindset
============================


Detect Issue

      ↓

Gather Information

      ↓

Check Logs

      ↓

Check Events

      ↓

Validate Configuration

      ↓

Test Networking

      ↓

Apply Fix

      ↓

Restart / Redeploy

      ↓

Monitor Recovery

      ↓

Document Root Cause
```


# Final Architecture

                 GitHub Repository
                         |
                         |
                 GitHub Actions CI
                         |
                         |
              Container Registry
                         |
                         |
                      ArgoCD
                         |
                         |
                  AWS EKS Cluster
                         |
        --------------------------------
        |              |               |
   Frontend        Backend        Database
        |
        |
 Prometheus + Grafana

        |
        |
 Kubernetes Scaling
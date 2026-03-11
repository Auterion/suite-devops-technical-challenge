# Suite Team DevOps Technical Interview Challenge

This hands-on challenge is designed to assess your practical skills with **Docker**, **Terraform**, **AWS**, and general **networking/infrastructure** knowledge.

You'll be building and deploying a simple HTTP service from scratch, scaling it, and putting it behind a load balancer — all using the tools we work with daily.

### What You'll Need

- Docker installed locally
- Terraform CLI (v1.5+)
- AWS CLI configured (credentials will be provided)
- Git
- A code editor of your choice
- Screen Sharing

### Getting Started

1. **Fork** this repository to your own GitHub account.
2. Clone your fork locally.
3. Configure the provided AWS credentials:
   ```bash
   export AWS_ACCESS_KEY_ID=<provided>
   export AWS_SECRET_ACCESS_KEY=<provided>
   export AWS_DEFAULT_REGION=us-east-1
   ```
4. Work through the milestones below **in order**.
5. When finished, commit (if not commited after each milestone), open a **Pull Request** back to the original repo's `main` branch.

## Milestones

### Milestone 1 — Build a Local HTTP Server in Docker

Create a containerized HTTP server that returns a simple response (e.g. a health check JSON, a hello-world page — your call).

**Requirements:**
- Edit the provided `Dockerfile` in the repo root
- The server should listen on port **8080**
- You choose the stack: Node.js, Python, Nginx, Apache, Go — whatever you're comfortable with
- Build and run the image locally; confirm you get a response on `http://localhost:8080`

### Milestone 2 — Deploy to AWS with Terraform

Use Terraform to deploy your Docker container as a running service on AWS.

**Requirements:**
- All infrastructure is defined in the `terraform/` directory
- Push your Docker image to **ECR** (create the repo via Terraform)
- Deploy the container so it is running on AWS (ECS Fargate, ECS on EC2, or EKS — your choice)
- The service should be reachable (even if only from within the VPC for now, but prefferably publicly)
- Access and show your deployed instace and page

**Hints:**
- The `terraform/` directory has starter files — use them as your starting point
- Don't forget to authenticate Docker with ECR before pushing

### Milestone 3 — Scale to 2 Instances

Scale your service to run **2 instances** of the container.

**Requirements:**
- Done via Terraform (not the AWS console)
- Both instances should be running and healthy
- Show both your individual instances and their respective pages

### Milestone 4 — Add a Load Balancer

Place an **Application Load Balancer (ALB)** in front of your service so it is accessible from the public internet on port 80.

**Requirements:**
- The ALB is defined in Terraform
- Requests to the ALB IP Address or DNS name on port 80 should be routed to your containers
- Both container instances should receive traffic
- Show that traffic and requests reaching your load balancer and instances

### Milestone 5 — Extra Credit: Network Hardening

Lock down the networking so that:
- The ALB accepts inbound traffic **only on port 80**
- The containers only accept traffic **from the ALB** (not directly from the internet)
- All of this is expressed in Terraform via **security groups** and, if you'd like, a dedicated **VPC/subnet** setup
- Show / proove that only traffic on port 80 is allowed
- Commit your final changes and push your PR

---

## Guidelines

- **Time:** Don't worry if you don't finish everything, we care about your approach and reasoning as much as the end result.
- **Searching is fine.** Use Documentation, Stack Overflow, Google, Coding Assistants, or just ask us. Whatever you'd normally use on the job. We're not testing memorization.
- **Talk through your thinking.** Narrate your decisions throught. It helps us understand your thought process.
- **Ask questions.** If something is genuinely ambiguous, ask. We are here to help you put your best foot forward

## Repo Structure

```
.
├── README.md
├── Dockerfile             // Docker image, empty initially
├── app/                   // The web server code
│   └── .gitkeep
├── terraform/
│   ├── providers.tf       // AWS provider config (starter provided)
│   ├── main.tf            // Your infrastructure (empty starter)
│   ├── variables.tf       // Your variables (empty starter)
│   └── outputs.tf         // Your outputs (empty starter)
└── .gitignore
```

## Cleanup

Don't worry about tearing down infrastructure, we'll handle that after the interview is done

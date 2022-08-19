## What is

GitOps is a set of best practices where the entire code delivery process is controlled via Git, including infrastructure and application definition as code and automation to complete updates and rollbacks.

## The Key GitOps Principles

- The entire system (infrastructure and applications) is described declaratively.
- The canonical desired system state is versioned in Git.
- Changes approved are automated and applied to the system.
- Software agents ensure correctness and alert on divergence.

## Flow

1. A GitOps agent is deployed on the cluster.
2. The GitOps agent is monitoring one or more Git repositories that define applications and contain Kubernetes manifests (or Helm charts or Kustomize files).
3. Once a Git commit happens the GitOps agent is instructing the cluster to reach the same state as what is described in Git.
4. Developers, operators. and other stakeholders perform all changes via Git operations and never directly touch the cluster (or perform manual kubectl commands).

![gitops.png](../../../imgs/gitops.png)

## Key points here are

- The state of the cluster is always described in Git. Git holds everything for the application and not just the source code.
- There is no external deployment system with full access to the cluster. The cluster itself is pulling changes and deployment information.
- The GitOps controller is running in a constant loop and always matches the Git state with the cluster state.

## Pros of GitOps

- Faster deployments
- Safer deployments
- Easier rollbacks
- Straightforward auditing
- Better traceability
- Eliminating configuration drift

## Chalanges of GitOps

- Teams will have to adjust their culture and way of working to support using Git as the single source of truth
- All changes will be committed, this may present a challenge when it comes to debugging a live environment where operators are used to connecting and using a terminal to make changes on the fly

## Prerequisites for adopting GitOps

- Good testing and CI already in place
- A strategy for dealing with promotions between environments (something will cover in later certifications)
- Secrets strategy

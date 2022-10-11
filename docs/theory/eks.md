![eks.png](img/eks_4848.png)

https://github.com/codecentric/cluster-overprovisioner
https://aws.amazon.com/ec2/instance-types/
https://aws.amazon.com/ec2/pricing/reserved-instances/pricing/

- Reserved Instances: very stable workloads that need to run production without any interruption for large periods of time
- Savings Plans: production workloads that need flexibility or use Fargate
- Spot Intances: production workloads that can be recovery, development and testing clusters
- On-demand: cover unavailable spot capacity

### Fargate
- Serveless pay-as-you-go compute engine for containers
- MicroVM is EKS node
- 1 pod per node
- cpu 250mm to 4000mm. 4 cents per CPU
- min ram 500Mi to 8Gi
- max ram 2Gi to 30 Gi. 0.5 cents per GB of memory
- Use savings plans to save money
- Expensive than EC2 intances
- more simple
- don't support GPU, no DaemonSets, no EBS volumes, No privileged pods
- Isolated pods, no container-escape attacks, encrypted local storage by default and manged security patching
- pod level billing
- use label.worload:serverless to identify if pod is going to be deployed in Fargate

### EBS vs EFS
- EBS default more options
- EFS sharing data and for large data volume, managed and autoscale
- Always review if volume still needed, Backup volumes and tag volumes
- move long term data to S3 or Glacier
- Newer generation, low performance and low avaiability is cheapper
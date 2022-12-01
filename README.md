# tf-aks-fluxcd
Tired of boostrapping Flux by hand? <br />
No CI/CD process to have that all setup? <br /> 
Not feeling like you want to run all those commands to perform your installation?

There is a solution:
- Terraform code to bootstrap Flux on AKS from your repository. This will use your `~/.kube/config` file and the current context to know where to perform the installation. And boostrap your GitOps repository to the desired location
## Pre-requisites
- Azure Kubernetes cluster already created
- Your kubectl context to be set to the cluster that you want to deploy.
## Setup
```bash
# Add your configuration to config.auto.tfvars, this will be automatically picked up by Terraform

branch          = "dev"                             # Branch for bootstraping
github_owner    = "julanu"                          # Repository owner
target_path     = "clusters/my-cluster"             # Relative path to your Flux files
repository_name = "gitops-kustomize-infrastructure" # Repository name
```

## Install
```bash
$ terraform init && terraform validate
$ terraform plan
$ terraform apply -var "github_token=<YOUR_TOKEN" -auto-approve
```

## View components
```bash
$ flux get all --all-namespaces   # View all flux components with crds

NAMESPACE  	NAME                     	REVISION   	SUSPENDED	READY	MESSAGE                                                                     
flux-system	gitrepository/flux-system	dev/1500ad2	False    	True 	stored artifact for revision 'dev/1500ad263a88782f677ace0aba87b405142ce989'	
[...]

$ kubectl get deployments -A      # View controler deployments

NAMESPACE     NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
flux-system   helm-controller           1/1     1            1           17s
flux-system   kustomize-controller      1/1     1            1           15s
flux-system   notification-controller   1/1     1            1           17s
flux-system   source-controller         1/1     1            1           17s
[...]
```
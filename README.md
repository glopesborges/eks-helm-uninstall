# EKS Helm Uninstall GitHub Action

This GitHub action uses AWS CLI to login to EKS and uninstall a deployed helm chart.

This GitHub action was based on the [eks-helm-deploy from the user peymanmortazavi](https://github.com/peymanmortazavi/eks-helm-deploy).
His project was forked and changed to suit my needs.

## Inputs
Input parameters allow you to specify data that the action expects to use during runtime.

- `aws-secret-access-key`: AWS secret access key part of the aws credentials. This is used to login to EKS. (required)
- `aws-access-key-id`: AWS access key id part of the aws credentials. This is used to login to EKS. (required)
- `aws-region`: AWS region to use. This must match the region your desired cluster lies in. (default: us-west-2)
- `cluster-name`: The name of the desired cluster. (required)
- `cluster-role-arn`: If you wish to assume an admin role, provide the role arn here to login as.
- `debug`: Enable verbose output.
- `dry-run`: Simulate an upgrade.
- `namespace`: Kubernetes namespace to use.
- `name`: Helm release name. (required)

## Example usage

```yaml
uses: glopesborges/eks-helm-uninstall@v1
with:
  aws-access-key-id: ${{ secrets.AWS_ACCESS__KEY_ID }}
  aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  aws-region: us-west-2
  cluster-name: mycluster
  namespace: dev
  name: release_name
```

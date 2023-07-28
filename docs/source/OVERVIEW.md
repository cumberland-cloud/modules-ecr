# Terraform Modules: ECR

[![terraform workflows](https://github.com/cumberland-cloud/modules-ecr/actions/workflows/action.yaml/badge.svg)](https://github.com/cumberland-cloud/modules-ecr/actions/workflows/action.yaml)

[![pages-build-deployment](https://github.com/cumberland-cloud/modules-ecr/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/cumberland-cloud/modules-ecr/actions/workflows/pages/pages-build-deployment)

A module for deploying an **Elastic Container Registry** and its associated resources.

## IAM Permissions

A default policy is created by this module and applied to the provisioned **ECR**. This policy grants all IAM users in the caller's **AWS** account full access to the _provisioned_ **ECR**, i.e. the `Resource` in the policy specifically targets the ARN of the **ECR** being reated. If a stricter policy is required, a policy with statements that contain an explicit `Effect` of `Deny` can be passed into the module. This policy will be merged with the default policy, i.e. the default policy will still be in effect, but may be overwritten by any statements that take precedence in the inputted policy.
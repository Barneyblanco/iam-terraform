# iam-terraform
A repo that contains scripts to create AWS iam users in different groups

HIGH LEVEL OVERVIEW

The simplest approach to create RBAC for users is to use groups to federate access.

This contains terraform scripts that executes RBAC for Users created in AWS IAM. There are four subsets of Users: Frontend Engineers, Backend Engineers, Data Engineers, Site Reliability Engineers (SRE).

There are four groups created for the respective subsets of Users which are: backend, frontend, devops, data-engineering. I attached the respective permissions for the group users to be able to access their respective resources:

i.   Data engineers - Redshift
ii.  SRE - they have access to all resources
iii. Frontend Engineers - Cloudfront
iv.  Backend Engineers - EKS

Implementation was made for logging using cloudtrail to capture the activities of the Users within the account.


There are two terraform modules: Iam module and logging module. The Iam module is where the implementations for the creation of Iam users are created, logging module is where the implementation for the logging is created.

There is a terragrunt folder which contains the terragrunt config. Terragrunt is used here to create resources across multiple environments to make extensibility alot easier. There are three environments: Dev, QA, Production which contains config to create Iam resources. There is a One-per-account terragrunt folder which creates cloudtrail and S3 for Audit logs.


# How to setup HPE Container Platform demo environment on Azure using Terraform with Jupyter Notebook

This aims to create a minimal demo environment in Microsoft Azure to run HPE Container Platform (EPIC 5.0) installation.
Please check bluedata4 branch for EPIC v4 installation.

Taken from the work of https://github.com/bluedata-community/bluedata-demo-env-aws-terraform

[Download](https://github.com/bluedata-community/bluedata-demo-env-azure-terraform) the repo and use the [Jupyter Notebook](https://jupyter.org/install) to follow the instructions for a complete demo environment.

This notebook follows similar process as outlined in aws template. To get started, from a console (tested on MacOS and Windows 10):
- `git clone https://github.com/bluedata-community/bluedata-demo-env-azure-terraform.git && cd bluedata-demo-env-azure-terraform`
- `python -m notebook`
- Open [AzureDeploy.ipynb](AzureDeploy.ipynb) file and follow steps there

## Start with setting up your Azure subscription

### Install Azure CLI 

`az account list --query "[].{name:name, subscriptionId:id, tenantId:tenantId}" --o tsv`

Get "subscriptionId" & "tenantId" noted

#### Set subscription to use

`az account set --subscription="subscriptionId"`

#### If not created a service principle, you need one with "Contributor" role

`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$subscriptionId"`

#### Take note of  AppId, Password, Name & Tenant from response (example output below)

    AppId                                 DisplayName                    Name                                  Password                              Tenant
    ------------------------------------  -----------------------------  ------------------------------------  ------------------------------------  ------------------------------------
    3dbee582-0000-0000-0000-06e44d93dd63  azure-cli-2019-12-10-07-12-40  http://azure-cli-2019-12-10-07-12-40  bf3f0384-0000-0000-0000-6c39aecaaa21  105b2061-0000-0000-0000-24d304d195dc

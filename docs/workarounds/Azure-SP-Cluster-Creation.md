# Azure SP Cluster Creation Workaround

## The Problem

At one time in Eagle's development life, service principals were the main way Azure was satisfied that our
automation was permitted to act on Azure resources.  In time, that dependency was broken in favor of
a much-improved pod identity basis.

At this time, however, an Azure implementation detail regarding permissions of derivative resources
prevents automation from completing EVERYTHING regarding this work.  In particular, we want our clusters
to manage their own DNS.  (This empowers developers to explore their solution space confidently with new projects.)
In order to do that, the AKS agentpool resource group must be granted permissions to the appropriate DNS zones.
After our tekton cluster's pod identity creates an AKS cluster, however, it receives no permissions at all to the resulting agentpool RG
-- and the managed identity Azure creates to participate in pod identity use cases.
... so in turn, our tekton cluster cannot grant access to a managed identity actor that it cannot see.

## Doing Your Part

Broadly, you are performing the following:

1. create an SP with a password to which you personally have access
1. noting the combination of SP object ID and credentials that will allow the AZ CLI to login as this SP
1. updating your `vars/azure.yml` file with those informational bits

So here are some commands for you.

```
az login
az ad sp create-for-rbac --name EagleTesting
```

This will output some data.  This will be the password, but it will not give you the ID of the thing you have just created.
Don't yell at me, I don't make the rules.

```
az ad sp list --display-name EagleTesting
```

This will list the SP's.  One of them will be the one you just created.  Use the ID field from that for app_id.

In a different terminal window:

```
ansible-vault edit vars/credentials.yml
```

You want to put the values into `azure_sp_workaround_app_id` and `azure_sp_workaround_passwd`.

From there, on your next/first Eagle run, the automation will handle the following:

1. Elevating the permissions of the SP you've provided appropriately
1. Creating a piece of YAML that Kubernetes can accept as a secret containing the credentials you've supplied
1. Placing that secret onto the tekton cluster
1. Training the "primary" build that is triggered by the home repository to be able to use those credentials during cluster creation
1. Ensuring the tekton pipeline run uses those SP credentials during the run instead of the pod's identity

## Getting Started

In your very first moments, you'll want to make sure that you have a Python installation that uses pip available on your workstation.

I don't necessarily recommend using the system installation, for a lot of reasons, but that may be the most comfortable for many people.

This repository contains encrypted material with Ansible Vault, so you'll need to get that password and arrange for your terminal to know it when you use these playbooks.

From there, `bin/pysetup.sh` is prepared to perform most of what the runtime needs for eagle are.

You would need to login to Azure tenant (at this writing) in a manner consistent for Ansible's usage.  In this case `az login --tenant TENANT_ID_GOES_HERE`

Finally, since these roles are not yet publicly named or distributed, you'd need to 'cheat' your ansible installation.  This works for me.

```
ln -s $(pwd)/bigfleet.azure ~/.ansible/roles/bigfleet.azure
ln -s $(pwd)/bigfleet.eagle ~/.ansible/roles/bigfleet.eagle
ln -s $(pwd)/bigfleet.flux2 ~/.ansible/roles/bigfleet.flux2
ln -s $(pwd)/bigfleet.k8s ~/.ansible/roles/bigfleet.k8s
ln -s $(pwd)/bigfleet.tekton ~/.ansible/roles/bigfleet.tekton
```

It has the other good property of allowing you to work with everything in the same directory structure at once without getting ansible galaxy involved.
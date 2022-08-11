#!/bin/bash

#setup script to get ansible controller ready to run regenisis
#currently only supports debian based systems, redhat support TBD
#NOTE before you run setup git ssh key

#update packages
sudo apt update

#install required packages
sudo apt-get install -y pip libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

#clone and build pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src

#add the following to .bashrc
#feel free to make this script idempotent, smartypants
if test -f ~/.bashrc; then
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
fi

#add the following to .profile if file exists 
#feel free to make this script idempotent, smartypants
if test -f ~/.profile; then
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile
source ~/.profile
fi

#add the following to .bash_profile if file exists 
#feel free to make this script idempotent, smartypants
if test -f ~/.bash_profile; then 
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
fi

#install python version and set globally 
pyenv install 3.10.4
pyenv global 3.10.4

#install ansible and azure tools
pip install ansible azure-cli-core

#install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc
source ~/.bashrc

#clone required repositories
mkdir eagle && cd eagle
git clone git@github.com:bigfleet/bigfleet.eagle.git
git clone git@github.com:bigfleet/bigfleet.tekton.git
git clone git@github.com:bigfleet/bigfleet.k8s.git
git clone git@github.com:bigfleet/regenesis.git
git clone git@github.com:bigfleet/bigfleet.azure.git
git clone git@github.com:bigfleet/bigfleet.flux2.git
git clone git@github.com:bigfleet/flux2-builder.git
git clone git@github.com:bigfleet/bigfleet.gitlab.git

#create symlinks to trick ansible
mkdir -p ~/.ansible/roles
ln -s $(pwd)/bigfleet.azure ~/.ansible/roles/bigfleet.azure
ln -s $(pwd)/bigfleet.eagle ~/.ansible/roles/bigfleet.eagle
ln -s $(pwd)/bigfleet.flux2 ~/.ansible/roles/bigfleet.flux2
ln -s $(pwd)/bigfleet.k8s ~/.ansible/roles/bigfleet.k8s
ln -s $(pwd)/bigfleet.tekton ~/.ansible/roles/bigfleet.tekton
ln -s $(pwd)/bigfleet.gitlab ~/.ansible/roles/bigfleet.gitlab

#install additional python requirements
./regenesis/bin/pysetup.sh

#setup ansible vault
read -sep 'Enter the ansible vault password:' VAULTPW #make password hidden in terminal
echo "$VAULTPW" into ~/.vault 
echo "export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault" >> ~/.profile #feel free to make this script idempotent, smartypants
source ~/.profile



# Mongo Prep

Debian
```
apt-get update && apt-get install -y wget gnupg2 && \
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
  echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
  apt-get update && apt-get install -y mongodb-org
```


kubectl run --rm -it --image=mcr.microsoft.com/aks/fundamental/base-ubuntu:v0.0.11 network-policy --labels app=zimcore --namespace zimcore

```
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
  apt-get update && apt-get install -y mongodb-org telnet
```

kubectl run --rm -it --image=mcr.microsoft.com/aks/fundamental/base-ubuntu:v0.0.11 network-policy --labels app=zimcore --namespace zimcore

mongosh -u root -p 0c8ae4e5587cf43fd97a --host mongodb.mongodb
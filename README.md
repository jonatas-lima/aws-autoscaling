# AWS Horizontal Autoscaling

## Antes de começar

1. Necessário ter uma conta válida na AWS, com [chaves de acesso](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey).
2. Instalar a CLI do Terraform:

```sh
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install -y terraform
```

3. Ter o `make` instalado:

```sh
sudo apt install -y make
```

## Diagrama Arquitetural

TODO

### Componentes provisionados

TODO

## Executando

* Copie e configure suas credenciais de acesso à AWS:

```sh
cp .profile.sample .profile
```

### Aplicação CPU-Bound

* Uma aplicação CPU-Bound será provisionada na infraestrutura, em que, com mais de 50% de uso da CPU, o autoscaler irá aumentar o número de instância em 1.

```sh
make apply
```

...Colocar mais detalhes

### Aplicação Memory-Bound

TODO

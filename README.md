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

4. Inicializar os módulos:

```sh
make init
```

## Visão Arquitetural

TODO

## Componentes provisionados

TODO

## Executando

* Copie e configure suas credenciais de acesso à AWS:

```sh
cp .profile.sample .profile
```

### Aplicação

* Uma aplicação CPU-Bound será provisionada na infraestrutura, em quea AWS temtará manter o uso médio da CPU das instâncias do _Autoscaling Group_ em 20%, o autoscaler irá aumentar o número de instâncias em 1.

```sh
make apply
```

### Estressando a infraestrutura

> Caso não tenha o endereço do Load Balancer em mãos, executar `terraform output`

Para estressar a infra da aplicação, pegue o endereço do Load Balancer que foi mostrado no `make apply` e faça:

```sh
./stress.sh <load balancer address> <goroutines number>
```

> O segundo paramêtro vai indicar quantas goroutines serão criadas, sendo o estresse de CPU diretamente proporcional a esse número.

* Exemplo:

```sh
./stress.sh alb-1484426253.us-east-1.elb.amazonaws.com 10000
```

## IMPORTANTE

### Não apague os arquivos *.tfstate

Esses arquivos são responsáveis por manter o estado da infraestrutura. Se eles forem apagados, o terraform não vai conseguir aplicar de forma correta as mudanças, tendo que apagar "na mão" tudo que foi criado previamente.

### Destrua a infraestrutura

Ao final dos experimentos executar:

```sh
make destroy
```

O comando vai destruir tudo que foi feito, evitando que a AWS cobre algum valor se você esquecer rodando.

### Cobranças adicionais

Se a infra ficar rodando por muito tempo, vai ser cobrado um valor. A AWS cobra por uso do recurso, então como estamos usando uma `t2.micro`, o valor vai ser simbólico (acredito que no máximo uns R$5,00 ~ R$10,00).

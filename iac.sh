#!/bin/bash

echo "Iniciando script"
echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários com senha padrão, com diretórios, adicionando nome completo e ao grupo correspondete..."

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM -c "Carlos Silva"
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM -c "Maria Silva"
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM -c "Joao Silva"

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN -c "Debora Silva"
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN -c "Sebastiana Silva"
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN -c "Roberto Siva"

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC -c "Josefina Silva"
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC -c "Amanda Silva"
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC -c "Rogerio Silva"

echo "Solicitando troca de senha no primeiro login..."

usermod carlos -e
usermod maria -e
usermod joao -e

usermod debora -e
usermod sebastiana -e
usermod roberto -e

usermod josefina -e
usermod amanda -e
usermod rogerio -e

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizando script....."

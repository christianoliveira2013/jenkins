/bin/bash

### Variáveis
tags="""
    auth: sssd\n
    team: alexandria\n
    sssd_team: alexandria\n
    datacenter: $DC\n
    environment: $ENVIROMENT
    """
apply_salt_sssd="salt-call state.apply sssd"

teste_connect(){
    nc -zvw1 $IP 22
}
####


if teste_connect != -1;then
    echo "Conexão bem sucessida, por tanto iremos iniciar as configurações"
    sshpass -p ${PASSWORD} ssh root@${IP} "$tags > /etc/sssd/sssd.conf"
    "sleep 1"
    sshpass -p ${PASSWORD} ssh root@${IP} "$apply_salt_sssd"
else
    echo "Conexão falhou, não podemos prosseguir nas configurações."
fi
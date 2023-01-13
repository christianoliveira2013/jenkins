FROM ubuntu:latest

# Atualizar os pacotes e instalar o sshpass
RUN apt-get update && \
    apt-get install -y sshpass netcat

# Copiar o script para o contêiner
COPY script.sh /usr/local/bin/

# Dar permissão de execução para o script
RUN chmod +x /usr/local/bin/script.sh

# Rodando script

CMD ["/usr/local/bin/script.sh"]
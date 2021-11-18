FROM ubuntu:focal

WORKDIR /usr/local/bin

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential

RUN useradd -ms /bin/bash somebody

USER somebody


CMD ["sh", "-c", "ansible-playbook --ask-vault-password $TAGS local.yml"]
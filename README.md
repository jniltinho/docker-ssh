## SSH Daemon (Linux + Supervisord Golang)

[![GitHub Open Issues](https://img.shields.io/github/issues/jniltinho/docker-ssh.svg)](https://github.com/jniltinho/docker-ssh/issues)
[![GitHub Stars](https://img.shields.io/github/stars/jniltinho/docker-ssh.svg)](https://github.com/jniltinho/docker-ssh)
[![GitHub Forks](https://img.shields.io/github/forks/jniltinho/docker-ssh.svg)](https://github.com/jniltinho/docker-ssh)
[![Stars on Docker Hub](https://img.shields.io/docker/stars/jniltinho/docker-ssh.svg)](https://hub.docker.com/r/jniltinho/docker-ssh)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/jniltinho/docker-ssh.svg)](https://hub.docker.com/r/jniltinho/docker-ssh)



Docker image with SSHD running under Linux and Supervisor.

#### Usage
to be able to connect user can provide port and password for `root` user. Please see examples below.

Example:

	docker run -d --name ssh jniltinho/docker-ssh

**if `root` passoword is not provided image will generate one and it can be retrived from logs**

    docker logs ssh|grep SSHD|awk '{print $(NF)}'
    docker logs ssh|grep SSHD
    [SSHD 09:49:22] root password set to: ota7zohsh0AZu2Ex

Login using that password:

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' ssh
    DOCKER_SSH_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ssh)
    ssh root@${DOCKER_SSH_IP}
    root@docker.ip's password: ota7zohsh0AZu2Ex

#### Environmental Variable

`ROOT_PASS` = root user password

#### Custom Password deployment

Example:

	docker run -d --name ssh -p 10022:22 --env="ROOT_PASS=my_pass" jniltinho/docker-ssh

### Docker troubleshooting


Use docker command to see if all required containers are up and running:

    $ docker ps -a

Check online logs of ssh container:

    $ docker logs ssh

Attach to running ssh container (to detach the tty without exiting the shell,
use the escape sequence Ctrl+p + Ctrl+q):

    $ docker attach ssh

Sometimes you might just want to review how things are deployed inside a running container, you can do this by executing a _bash shell_ through _docker's exec_ command:

    docker exec -i -t ssh /bin/bash

History of an image and size of layers:

    docker history --no-trunc=true jniltinho/docker-ssh |tr -s ' '|tail -n+2|awk -F " ago " '{print $2}'


# Build Docker

If you want to build these images by yourself, please follow below commands.

```
git clone https://github.com/jniltinho/docker-ssh.git
cd docker-ssh
make

## Default Make RockyLinux
## Alpine, Ubuntu, Debian, OpenSUSE, AlmaLinux, CentOS6, CentOS7, CentOS8, Fedora
## make alpine
## make ubuntu
## make debian
## make opensuse
## make alma
## make centos6
## make centos7
## make centos8
## make fedora
## make rocky
```

---
## Author

Author: Nilton Oliveira


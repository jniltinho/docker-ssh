.PHONY: all

all: rocky


debian:
	docker build --no-cache -t debian-docker-ssh -f distros/Dockerfile-debian .
	docker images *-docker-ssh

ubuntu:
	docker build --no-cache -t ubuntu-docker-ssh -f distros/Dockerfile-ubuntu .
	docker images *-docker-ssh

rocky:
	docker build --no-cache -t rocky-docker-ssh -f distros/Dockerfile-rocky .
	docker images *-docker-ssh

alma:
	docker build --no-cache -t alma-docker-ssh -f distros/Dockerfile-alma .
	docker images *-docker-ssh

centos6:
	docker build --no-cache -t centos6-docker-ssh -f distros/Dockerfile-centos6 .
	docker images *-docker-ssh

centos7:
	docker build --no-cache -t centos7-docker-ssh -f distros/Dockerfile-centos7 .
	docker images *-docker-ssh

centos8:
	docker build --no-cache -t centos8-docker-ssh -f distros/Dockerfile-centos8 .
	docker images *-docker-ssh

fedora:
	docker build --no-cache -t fedora-docker-ssh -f distros/Dockerfile-fedora .
	docker images *-docker-ssh

opensuse:
	docker build --no-cache -t opensuse-docker-ssh -f distros/Dockerfile-opensuse .
	docker images *-docker-ssh
	
alpine:
	docker build --no-cache -t alpine-docker-ssh -f distros/Dockerfile-alpine .
	docker images *-docker-ssh

FROM rockylinux:9

ENV TZ America/Sao_Paulo
ENV ROOT_PASS=password

## Criando a imagem docker
## docker build --no-cache -t docker-rockylinux-ssh .

RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc

RUN yum clean all; yum update -y \
    && yum install --nogpgcheck -y ncurses xz procps net-tools wget \
    curl python3 ca-certificates openssh-server openssh-clients sudo hostname \
    && yum clean all && rm -rf /tmp/yum*

RUN ssh-keygen -A \
    && sed -i -r 's/.?UseDNS\syes/UseDNS no/' /etc/ssh/sshd_config \
    && sed -i -r 's/.?ChallengeResponseAuthentication.+/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config \
    && sed -i -r 's/.?PermitRootLogin.+/PermitRootLogin yes/' /etc/ssh/sshd_config

## https://github.com/ochinchina/supervisord
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord

RUN curl -skLO https://github.com/upx/upx/releases/download/v3.96/upx-3.96-amd64_linux.tar.xz \
    && tar -xf upx-*.tar.xz; mv upx-*/upx /usr/local/bin/; rm -rf upx-3.* \
    && upx --best --lzma /usr/local/bin/supervisord
    
RUN curl -skLO https://github.com/girigiribauer/go-pwgen/releases/download/v0.2.1/pw-linux-amd64.tar.gz \
    && tar -xf pw-linux-amd64.tar.gz; mv pw /usr/local/bin/pwgen; rm -f pw-linux-amd64.tar.gz \
    && upx --best --lzma /usr/local/bin/pwgen    


EXPOSE 9001 22

COPY container-files /
ENTRYPOINT ["/config/bootstrap.sh"]

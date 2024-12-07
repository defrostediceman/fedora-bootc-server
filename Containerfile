FROM ghcr.io/defrostediceman/fedora-bootc-base

ADD etc etc

ADD usr usr

RUN dnf -y install nvidia-driver && \
    dnf install -y nvidia-container-toolkit && \
    rm /var/log/*.log /var/lib/dnf -rf
FROM ghcr.io/defrostediceman/fedora-bootc-base

ADD etc etc

ADD usr usr

RUN dnf -y install nvidia-driver && \
    dnf install -y nvidia-container-toolkit && \
    rm /var/log/*.log /var/lib/dnf -rf

# Required for Logically Bound images, see https://gitlab.com/fedora/bootc/examples/-/tree/main/logically-bound-images/usr/share/containers/systemd
RUN ln -sr /etc/containers/systemd/*.container /usr/lib/bootc/bound-images.d/
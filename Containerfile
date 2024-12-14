FROM quay.io/fedora/fedora-bootc:41

ADD etc etc

ADD usr usr

RUN dnf install -y cockpit \
                    cockpit-podman \ 
                    cockpit-storaged \
                    cockpit-machines \
                    cockpit-networkmanager \
                    cockpit-files \
                    qeu \
                    qemu-kvm \
                    firewalld \
                    crun-vm \
                    git \
                    neovim \
                    tmux \
                    && dnf clean all

RUN dnf -y install nvidia-driver nvidia-container-toolkit && \
    rm /var/log/*.log /var/lib/dnf -rf && \
    dnf clean all

# Required for Logically Bound images, see https://gitlab.com/fedora/bootc/examples/-/tree/main/logically-bound-images/usr/share/containers/systemd
RUN ln -sr /etc/containers/systemd/*.container /usr/lib/bootc/bound-images.d/

RUN systemctl enable fstrim.timer \ 
                        cockpit.socket \
                        podman.socket \
                        podman-auto-update.timer \

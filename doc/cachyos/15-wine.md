# bottles

```bash
# bottles # wine manager to launch app
paru bottles
```

# winboat

winboat doesn't work on cachyos with BTRFs

```bash
# winboat # window docker emulater. has high compatibility but low performance for gaming since docker
sudo pacman -S winboat docker podman-compose
```

# lutris

not currently installed as bottles and winboat seems to fit better

```bash
# lutris # wine manager to launch app
```

# protonplus

used to install different versions of proton like dwproton

```bash
# protonplus # wine manager that includes dwproton
paru protonplus
```

# QEMU and VMM

used to run full VM on cachyos

Ref: https://wiki.cachyos.org/virtualization/qemu_and_vmm_setup/

```bash
# This will install the needed packages (note the "Windows 11" note below):
sudo pacman -S qemu-full virt-manager swtpm

# Force libvirt to use iptables
echo 'firewall_backend = "iptables"' | sudo tee -a /etc/libvirt/network.conf

# This will add the user to the "libvirt" group so they can use it:
sudo usermod -aG libvirt $USER

# LXC backend (optional, for linux containers, enabling both backends does not conflict):
systemctl enable --now libvirtd.service

# QEMU backend (for VMs):
systemctl enable --now libvirtd.socket

# This will bring Internet up in a VM whenever one starts:
sudo virsh net-autostart default

# And to enable the entire VM network to have unfettered transit: (You should consider if you need more granular firewall rules based on your use case and security posture)
sudo ufw route allow from 192.168.122.0/24
```

If you are installing Windows 11 in a virtual machine, you’ll either need to pass through your compatible TPM module,
later in the configuration step, or install swtpm if you don’t have one.

#!/usr/bin/env bash
set -x
  
virsh nodedev-reattach pci_0000_03_00_1
virsh nodedev-reattach pci_0000_03_00_0

modprobe -r vfio-pci

modprobe snd_hda_intel
modprobe amdgpu

echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

systemctl start display-manager.service


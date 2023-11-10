# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.

#---------------------------------------------------------------------
# Imports and basic configuration
#---------------------------------------------------------------------
{ config, lib, pkgs, modulesPath, ... }:

{
  #---------------------------------------------------------------------
  # Module imports
  #---------------------------------------------------------------------
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  #---------------------------------------------------------------------
  # Boot configuration
  #---------------------------------------------------------------------
  boot = {
    initrd.availableKernelModules = [

      "ahci"           # Enables the Advanced Host Controller Interface (AHCI) driver, typically used for SATA (Serial ATA) controllers.
      "ehci_pci"       # Enables the Enhanced Host Controller Interface (EHCI) driver for PCI-based USB controllers, providing support for USB 2.0.
      "firewire_ohci"
      "sd_mod"         # Enables the SCSI disk module (sd_mod), which allows the system to recognize and interact with SCSI-based storage devices.
      "sdhci_pci"
      "sr_mod"         # Loads the SCSI (Small Computer System Interface) CD/DVD-ROM driver, allowing the system to recognize and use optical drives.
      "uas"            # Enables the USB Attached SCSI (UAS) driver, which provides a faster and more efficient way to access USB storage devices.
      "usbhid"         # Enables the USB Human Interface Device (HID) driver, which provides support for USB input devices such as keyboards and mice.
      "usb_storage"    # Enables the USB Mass Storage driver, allowing the system to recognize and use USB storage devices like USB flash drives and external hard drives.

  ];

    extraModulePackages = [ ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" "tcp_bbr" ];

    kernelParams = [

    "mitigations=off"
    "quiet"
    "intel_pstate=ondemand"

    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d89506fc-de68-4fd3-9616-e087be4e3b79";
    fsType = "ext4";

    # Optimize SSD
    options = [

      # Optimised && suitable for SSDs and NVMe drives to ensure good performance and longevity.

      "commit=600"                  # nvme tweak?
      "data=ordered"                # Ensures data ordering, improving file system reliability and performance by writing data to disk in a specific order.
      "defaults"                    # Applies the default options for mounting, which usually include common settings for permissions, ownership, and read/write access.
      "discard"                     # Enables the TRIM command, which allows the file system to notify the storage device of unused blocks, improving performance and longevity of solid-state drives (SSDs).
      "errors=remount-ro"           # Remounts the file system as read-only (ro) in case of errors to prevent further potential data corruption.
      "noatime"                     # Disables updating access times for files, improving file system performance by reducing write operations.
      "nodiratime"                  # Disables updating directory access time, improving file system performance by reducing unnecessary writes.
      "relatime"                    # Updates the access time of files relative to the modification time, minimizing the performance impact compared to atime

    ];

  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B4B0-FC0D";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/56ac6d56-3bb7-412f-a1f5-bb53aa85520e"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.

  networking.useDHCP = lib.mkDefault true;

  # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}

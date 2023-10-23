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
  boot.initrd.availableKernelModules = [

    "ahci"
    "ehci_pci"
    "thunderbolt"
    "sd_mod"
    "sdhci_pci"
    "sr_mod"
    "usb_storage"
    "nvme"
    "xhci_pci"

  ];

  boot.extraModulePackages = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [

      "kvm-intel"
      "tcp_bbr"       # Dynamically optimize how data is sent over a network, aiming to achieve higher throughput and reduced latency

    ];

    # Enable BBR congestion control algorithm for TCP, , which can lead to improved network throughput and reduced latency.

  boot.kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
    };
    
  boot.kernelParams = [

    "mitigations=off"
 #   "quiet"
    "intel_pstate=ondemand"

  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/868d2910-5f1a-4a0a-95fe-c0e33dc7009d";
    fsType = "ext4";

    # Optimize SSD
    options = [

      "data=ordered"        # Ensures data ordering, improving file system reliability and performance by writing data to disk in a specific order.
      "defaults"            # Applies the default options for mounting, which usually include common settings for permissions, ownership, and read/write access.
      "discard"             # Enables the TRIM command, which allows the file system to notify the storage device of unused blocks, improving performance and longevity of solid-state drives (SSDs).
      "errors=remount-ro"   # Remounts the file system as read-only (ro) in case of errors to prevent further potential data corruption.
      "nodiratime"          # Disables updating directory access time, improving file system performance by reducing unnecessary writes.
      "relatime"            # Updates the access time of files relative to the modification time, minimizing the performance impact compared to atime
      # "noatime"           # Disables updating access times for files, improving file system performance by reducing write operations.

    ];

  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E5D0-EC81";
    fsType = "vfat";
  };

  swapDevices = [ ];

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

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
    "firewire_ohci"
    "sd_mod"
    "sdhci_pci"
    "sr_mod"
    "usb_storage"

  ];

  boot.extraModulePackages = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "mitigations=off" ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/d89506fc-de68-4fd3-9616-e087be4e3b79";
      fsType = "ext4";

    # Optimize SSD
    options = [
      "data=ordered"
      "discard"
      "errors=remount-ro"
      "noatime"
      "nodiratime"
    ];
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B4B0-FC0D";
      fsType = "vfat";
  };

  #---------------------------------------------------------------------
  # Mounting options for samba
  #---------------------------------------------------------------------
 # fileSystems."/mnt/sambashare" =

 #   {
 #     device = "//192.168.0.20/LinuxData/HOME/PROFILES/NIXOS-23-05/TOLGA/";
 #     fsType = "cifs";
 #     options = let
 #       automountOpts =
 #         "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,x-systemd.requires=network.target";
 #       uid =
 #         "1000"; # Replace with your actual user ID, use `id -u <YOUR USERNAME>` to get your user ID
 #       gid =
 #         "100"; # Replace with your actual group ID, use `id -g <YOUR USERNAME>` to get your group ID
 #       vers = "3.1.1";
 #       cacheOpts = "cache=loose";
 #       credentialsPath = "/etc/nixos/core/system/network/smb-secrets";

  #    in [
  #      "${automountOpts},credentials=${credentialsPath},uid=${uid},gid=${gid},vers=${vers},${cacheOpts}"
  #    ];

  #  };

  swapDevices = [ { device = "/dev/disk/by-uuid/56ac6d56-3bb7-412f-a1f5-bb53aa85520e"; } ];

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

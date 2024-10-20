{ config, pkgs, ... }:  {

  boot.loader = {

    timeout = 30;

    efi = {
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;
      devices = [ "nodev" ];
      useOSProber = true;
      efiSupport=true;
      efiInstallAsRemovable = true;

      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
      '';

    };

  };

  


}

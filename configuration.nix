{
  modulesPath,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
    pkgs.screenfetch
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICR46yVscbphm3cOKuE37/64XMSlID/DVm+UaBoUvZxG haroldzhao@Harolds-Mac-mini.local
  ];

  system.stateVersion = "23.11";
}

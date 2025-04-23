{ config, pkgs, inputs, lib, self, ... }:

{
  imports =
    [
      # ../../modules/aagl.nix
      ../../modules/bootloader.nix
      ../../modules/cosmic.nix
      ../../modules/font.nix
      # ../../modules/gpupassthrough.nix
      # ../../modules/greetd.nix
      ../../modules/hardware.nix
      ./hardware-configuration.nix
      ./disk-config.nix
      # ../../modules/japanese.nix
      ../../modules/network.nix
      ../../modules/packages.nix
      ../../modules/pipewire.nix
      ../../modules/program.nix
      ../../modules/virtualisation.nix
      ../../modules/security.nix
      ../../modules/services.nix
      # ../../modules/specialisation.nix
      ../../modules/system.nix
      ../../modules/user.nix
      inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];
  # services.desktopManager.plasma6.enable = true;
  # services.displayManager.sddm.enable = true;
  networking.hostName = "nix-laptop";

  security.polkit = {
    enable = true;
  };

  services.fwupd.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk             # Alternatively, kdePackages.fcitx5-qt
      fcitx5-chinese-addons  # Table input method support
      fcitx5-nord            # A color theme
    ];
  };
}

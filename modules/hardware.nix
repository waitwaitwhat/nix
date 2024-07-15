{ config , ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    brillo.enable = true;
    steam-hardware.enable = true;
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };
}

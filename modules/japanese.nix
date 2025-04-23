{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    type = "ibus";
    enable = true;
    ibus.engines = with pkgs.ibus-engines; [mozc];
  };

  environment.variables = {
    IBUS_ENABLE_SYNC_MODE = "1";
  };
}

{ config, lib, pkgs, ... };

{
  i18n.consoleFont = "Iosevka";
  i18n.consoleKeyMap = "us";
  i18n.defaultLocale = "en_AU.UTF-8"
  fonts.fonts = with pkgs; [
    ipafont
    kochi-substitute
  ];
  fonts.fontconfig.ultimate.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "Iosevka"
      "IPAGothic"
    ];
  };
  i18n.inputMethod.enabled = "fcitx";
  i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [mozc];
}

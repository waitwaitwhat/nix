{
  # This file defines a bunch of options to be used on the NixOS system, such as the default fonts, time zone, etc.
  # If you find yourself editing this file, then you're probably planning to install my entire NixOS configuration. I don't
  # recommend this. Also see system/boot.nix and system/sys.nix
  # Also inspect home/options.nix for user options.

  ####################################################
  # You may wish to change the system's hostname. This can be achieved by editing the line below. Suppose you want to set
  # the hostname to 'Hyprnix', you'd edit the line like so:
  # ...
  #    hostName = "Hyprnix";
  # ...
  #
  # Your hostname will be visible to other gadgets on the network, just so you know.
  # Required by system/networking.nix
  # hostName = "nix-laptop";

  ####################################################
  # The variable below defines the locale to be used on the computer. It is used by apps to determine language settings,
  # sort orders, currency formats, etc. Suppose you're based in the Netherlands, you'd change the locale like so:
  # ...
  #    theLocale = "nl_NL.UTF-8";
  # ...
  #
  # If you set the wrong locale, apps like the browser might display dates and currency in "incorrect formats".
  # Required by system/locale.nix
  # theLocale = "en_AU.UTF-8";

  ####################################################
  # You almost certainly want to edit the line below. It defines the time zone used when displaying times and dates. Suppose
  # you're based in New York, USA, you'd edit the line below like so:
  #
  # ...
  #    theTimezone = "America/New_York";
  # ...
  #
  # See https://en.wikipedia.org/wiki/List_of_tz_database_time_zones for a list of possible values.
  # Required by system/locale.nix
  # theTimezone = "Australia/Melbourne";

  ####################################################
  # The variable below is used by the flake to determine the system architecture. By default, it's for 64-bit Intel/AMD Linux.
  # Suppose you're on 64-bit Intel macOS, you'd edit the line below like so:
  #
  #...
  #   system = "x86_64-darwin";
  #...
  #
  # However, I can not guarantee that the rest of this NixOS configuration will function properly in that case. It will not.
  # Required by flake.nix
  # system = "X86_64-linux";

  ####################################################
  # The 'fontName' variable below is used by apps like Waybar and Kitty to determine which font to use. It is *not* the actual font
  # package that will get installed. Suppose you've installed the Iosevka font and would like all your apps to use it, you'd edit the
  # line below like so:
  #
  # ...
  #    fontName = "Iosevka Nerd Font";
  # ...
  #
  #
  # NOTE: 
  #     - You should install the font yourself, manually. This variable just exists to let your apps know which font to use.
  #     - Don't add 'Mono' in front of the fontName... otherwise icons will appear 'too small' in Kitty.
  # Required by system/fonts.nix
  fontName = "Iosevka Nerd Font";

  #####################################################
  # Do not modify the variable below.
  # We're using it to make sure that home-manager's stateVersion is in sync with the system's stateVersion.
  # stateVersion = "23.11";
}

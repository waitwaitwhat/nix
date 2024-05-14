{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.ignoreDups = true;
    shellAliases = { };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    zplug = {
      enable = true;
      plugins = [
        {name = "catppuccin/zsh-syntax-highlighting";}
        {name = "jeffreytse/zsh-vi-mode";}
        {name = "chisui/zsh-nix-shell";}
        {name = "nix-community/nix-zsh-completions";}
        {name = "zsh-users/zsh-completions";}
      ];
    };
    initExtraFirst = ''
      export PATH="$HOME/.local/bin:$PATH"
      # TODO: See if there is better way to set this? Seems not
      zstyle ':completion:*' menu select
    '';
  };
}

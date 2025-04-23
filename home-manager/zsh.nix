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
        {name = "junegunn/fzf";}
        {name = "catppuccin/zsh-syntax-highlighting";}
        {name = "jeffreytse/zsh-vi-mode";}
        {name = "chisui/zsh-nix-shell";}
        {name = "nix-community/nix-zsh-completions";}
        {name = "zsh-users/zsh-completions";}
        {name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ];}
      ];
    };
    initExtraFirst = ''
      export PATH="$HOME/.local/bin:$PATH"
      export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
      # TODO: See if there is better way to set this? Seems not
      zstyle ':completion:*' menu select
      if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    '';
  };
}

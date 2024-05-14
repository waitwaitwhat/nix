{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "waitwaitwhat";
    userEmail = "czekacwhat@protonmail.com";
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}

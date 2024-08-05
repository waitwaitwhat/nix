{ ... }: 
{
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    pam = {
      # yubico = {
        # enable = true;
        # debug = true;
        # mode = "challenge-response";
      # };
      services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
      };
    };
    polkit.enable = true;
  };
}

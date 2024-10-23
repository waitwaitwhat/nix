{
  specialisation = { 
    "VFIO".configuration = {
      system.nixos.tags = [ "with-vfio" ];
      vfio.enable = true;
    };
  };
}

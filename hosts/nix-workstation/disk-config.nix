{
  disko.devices =
  {
    disk =
    {
      nvme1n1 =
      {
        type = "disk";
        device = "/dev/nvme1n1";
        content =
        {
          type = "gpt";
          partitions =
          {
            boot =
            {
              size = "1G";
              type = "EF00";
              content =
              {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["defaults"];
              };
            };
            system =
            {
              size = "100%";
              content =
              {
                type = "luks";
                name = "system";
                askPassword = true;
                settings.allowDiscards = true;
                content =
                {
                  type = "btrfs";
                  extraArgs = ["-f"]; # Override existing partition
                  subvolumes =
                  {
                    "@/" =
                    {
                      mountpoint = "/";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/home" =
                    {
                      mountpoint = "/home";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/nix" =
                    {
                      mountpoint = "/nix";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/swap" =
                    {
                      mountpoint = "/swap";
                      mountOptions = ["noatime" "nodatacow" "nodatasum" "discard=async"];
                      swap =
                      {
                        swap-0.size = "16G";
                        swap-0.path = "swap-0";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

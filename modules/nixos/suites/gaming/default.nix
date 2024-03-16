{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.gaming;
in {
  options.suites.gaming = with types; {
    enable = mkBoolOpt false "Enable the gaming suite";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [pkgs.prismlauncher pkgs.steam];
 
 hardware.opengl = {
  ## radv: an open-source Vulkan driver from freedesktop
  driSupport = true;
  driSupport32Bit = true;

  ## amdvlk: an open-source Vulkan driver from AMD
  extraPackages = [ pkgs.amdvlk ];
  extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
};};
}

{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.development;
in {
  options.suites.development = with types; {
    enable = mkBoolOpt false "Enable the desktop suite";
  };

  config = mkIf cfg.enable {
     environment.systemPackages = [ pkgs.unzip pkgs.git pkgs.rustup pkgs.jetbrains.rust-rover pkgs.jetbrains-toolbox pkgs.neovim pkgs.neovide pkgs.foot pkgs.vscode pkgs.fzf pkgs.gcc];
     };
}

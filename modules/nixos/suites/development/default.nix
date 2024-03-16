{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.common;
in {
  options.suites.common = with types; {
    enable = mkBoolOpt false "Enable the common suite";
  };

  config = mkIf cfg.enable {
     environment.systemPackages = [ pkgs.git pkgs.rustup pkgs.jetbrains.rust-rover pkgs.neovim pkgs.neovide pkgs.foot pkgs.vscode pkgs.fzf];
     };
}

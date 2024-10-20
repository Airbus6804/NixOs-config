{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.discord.override {
      # remove any overrides that you don't want
      withOpenASAR = true;
      withVencord = true;
    })
    pkgs.vesktop
  ];

  programs.hyprland.xwayland.enable = true;

}

{pkgs,  ... }:
{
  imports = [
    ./wofi/wofi.nix
    ./waybar/waybar.nix
    ./hyprpaper/hyprpaper.nix
  ];

  fonts.packages = with pkgs; [                                                                          
    noto-fonts                                                                                           
    noto-fonts-cjk                                                                                       
    noto-fonts-emoji                                                                                     
    liberation_ttf
    nerdfonts
    roboto-mono
    font-awesome
  ];

}
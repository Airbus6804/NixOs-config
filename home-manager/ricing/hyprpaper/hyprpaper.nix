{config, ...}:

let 
  hyprpaperPath = "~/.config/hypr";
in  
{
  
  home.file.".config/hypr/wallpaper.jpg" = {
    source = ./wallpaper.jpg;
  };

  home.file.".config/hypr/hyprpaper.conf" = {
    #source = ./hyprpaper.conf;
    text = ''
      preload = ${hyprpaperPath}/wallpaper.jpg
      wallpaper = HDMI-A-1,${hyprpaperPath}/wallpaper.jpg

      #enable splash text rendering over the wallpaper
      splash = true

    '';
  };


}
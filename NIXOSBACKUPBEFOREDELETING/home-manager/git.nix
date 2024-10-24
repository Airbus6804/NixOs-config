{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "alessio";
    userEmail = "aleragonesi04@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };

}

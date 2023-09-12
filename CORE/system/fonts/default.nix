{ pkgs, ... }:

{

  #---------------------------------------------------------------------
  # Custom fonts - Chris Titus && wimpysworld
  #---------------------------------------------------------------------

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ "FiraCode" "SourceCodePro" "UbuntuMono" ];
      })

      # (nerdfonts.override {fonts = ["Iosevka" "JetBrainsMono"];})
      # gg-sans

      comfortaa
      comic-neue
      dejavu_fonts
      fira
      fira-go
      font-awesome
      hackgen-nf-font
      inter
      iosevka-bin
      jetbrains-mono
      jost
      joypixels
      lato
      lexend
      liberation_ttf
      line-awesome
      material-design-icons
      material-icons
      nerd-font-patcher
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
      source-han-sans
      source-sans
      source-serif
      twemoji-color-font
      ubuntu_font_family
      work-sans

    ];

    #---------------------------------------------------------------------
    # Enable a basic set of fonts providing several font styles and 
    # families and reasonable coverage of Unicode.
    #---------------------------------------------------------------------

    enableDefaultFonts = false;

    fontconfig = {
      antialias = true;

      defaultFonts = {
        emoji = [ "Joypixels" "Noto Color Emoji" ];
        monospace = [ "FiraCode Nerd Font Mono" "SauceCodePro Nerd Font Mono" ];
        sansSerif = [ "Work Sans" "Fira Sans" "FiraGO" ];
        serif = [ "Source Serif" ];
      };

      enable = true;
      hinting = {
        autohint = false;
        enable = true;
        style = "hintslight";
      };

      subpixel = {
        lcdfilter = "light";
        rgba = "rgb";
      };

    };
  };

}

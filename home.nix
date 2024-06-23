{ config, pkgs, ... }:

{
  home = {
    stateVersion = "23.11";
  };
  
  imports = [
    ./neovim.nix
  ];

  programs = {
    git = {
      enable = true;
      userName = "Jerry Starke";
      userEmail = "42114389+JerrySM64@users.noreply.github.com";
    };
    
    gh = {
      enable = true;
    };

    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };

    kitty = {
      enable = true;
      settings = {
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
      };
      extraConfig = ''
        tab_bar_style fade
        tab_fade 1
        active_tab_font_style   bold
        inactive_tab_font_style bold
      '';
    };
  };
}

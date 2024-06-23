{ self, pkgs, ... }: {
  
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    kitty
  ];
  
  # Auto upgrade nix package and the daemon service.
  services = {
    nix-daemon = {
      enable = true;
    };
  };
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    zsh = {
      enable = true;
    };
  };

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 4;
  };
 
  nixpkgs = {
    # The platform the configuration will be used on.
    hostPlatform = "aarch64-darwin";
  };

  # User
  users = {
    users = {
      jerry = {
        name = "jerry";
        home = "/Users/jerry";
      };
    };
  };
}
  

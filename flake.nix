{
  description = "macOS Development Flake with ZaneyOS components";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, ... }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Jerrys-Mac-mini
    darwinConfigurations."Jerrys-Mac-mini" = darwin.lib.darwinSystem {
      specialArgs = {
        inherit self;
      };
      modules = [ 
        #darwinConfigurations
        ./darwin.nix
        home-manager.darwinModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users = {
              jerry = import ./home.nix;
            };
            extraSpecialArgs = {
              inherit inputs;
              inherit self;
            };
          };
        }
      ];
      system = "aarch64-darwin";
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Jerrys-Mac-mini".pkgs;
  };
}

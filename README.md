# macOS-DE
This is my macOS Development Environment (DE in short to mess with people reading DE as Desktop Environment. ;P)

It's a basic Nix Flake with the Neovim configuration from [ZaneyOS](https://gitlab.com/Zaney/zaneyos) as it's the one that fits my workflow perfectly.

# How to use
Install Nix on your Mac by entering the following command in the terminal:
`sh <(curl -L https://nixos.org/nix/install)`

Then get the flake by by doing a simple Clone:
`mkdir ~/.config && git clone https://github.com/jerrysm64/macos-de ~/.config/nix`

Since everything's set up for me, you need to change the hostname and username so they fit for you. This is done in darwin.nix and flake.nix. Also you need to chage your Git Name and Email in home.nix. This step will be simplified at a later date.

When you have done all that, you're good to go. Execute this command to build the flake and then you are done:
`nix run nix-darwin -- switch --flake ~/.config/nix`

# Updating and rebuilding the flake
## Updating
To update the Flake and all of it's programs, simply execute:
`cd ~/.config/nix && nix flake update && darwin-rebuild switch --flake ~/.config/nix`

## Rebuilding after a change
When you tweaked a few things, you need to rebuild the Flake. To do that, run:
`darwin-rebuild switch --flake ~/.config/nix`

# Credits
* [Tyler Kelley for making ZaneyOS in the first place](https://gitlab.com/Zaney)
* [Lin Xianyi for helping me debugging a few issues](https://github.com/iynaix)
* [The NixOS Foundation for creating Nix](https://nixos.org)

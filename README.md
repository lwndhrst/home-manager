# Nix home-manager config for WSL 2

## Steps

1. [Install and setup WSL2](https://learn.microsoft.com/en-us/windows/wsl/install), e.g. with Debian.
   Note: restart of Windows machine might be necessary.

2. Perform [single-user installation](https://nixos.org/download.html#nix-install-linux) of the Nix package manager.
   ```
   sh <(curl -L https://nixos.org/nix/install) --no-daemon
   ```
   Note: you may need to install a few extra packages, e.g. `curl` and `xz-utils` on Debian.

3. [Standalone installation for home-manager](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)
   ```
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   ```
   ```
   nix-channel --update
   ```
   ```
   nix-shell '<home-manager>' -A install
   ```
   Clone this repo to `~/.config/home-manager` and rebuild.
   ```
   git clone https://github.com/lwndhrst/home-manager-wsl ~/.config/home-manager
   ```
   ```
   home-manager switch
   ```

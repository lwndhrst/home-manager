# Nix + Home Manager configuration for WSL 2

## Setup

1. [Install and setup WSL2](https://learn.microsoft.com/en-us/windows/wsl/install), e.g. with Debian.
   <br>Note: restart of Windows machine might be necessary.

2. Install nix via the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer).
   ```
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --init none
   ```
   Note: you may need to install a few extra packages, such as `curl` or `git`.

3. Initial setup of [Home Manager with Flakes](https://nix-community.github.io/home-manager/index.html#ch-nix-flakes).
   ```
   git clone https://github.com/lwndhrst/home-manager-wsl ~/.config/home-manager
   ```
   ```
   nix run home-manager/master -- switch
   ```

4. Update as follows:
   ```
   nix flake update && home-manager switch
   ```

## Misc

- For removing Windows PATH and disabling execution of Windows binaries add the following to `/etc/wsl.conf`:
   ```
   [interop]
   enabled = false
   appendWindowsPath = false
   ```
   Note: requires restart of WSL: `wsl --shutdown`.

- Set `zsh` as default shell by first adding its absolute path to `/etc/shells` and then running `chsh`
   ```
   /home/<user>/.nix-profile/bin/zsh
   ```
   ```
   chsh -s /home/<user>/.nix-profile/bin/zsh
   ```

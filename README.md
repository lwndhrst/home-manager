# Nix + Home Manager configuration for WSL 2

## Setup

1. [Install and setup WSL2](https://learn.microsoft.com/en-us/windows/wsl/install), e.g. with Debian.
   <br>Note: restart of Windows machine might be necessary.

2. Install nix via the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer).
   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --init none
   ```
   Note: you may need to install a few extra packages, such as `curl` or `git`.

3. Initial setup of [Home Manager with Flakes](https://nix-community.github.io/home-manager/index.html#ch-nix-flakes).
   ```sh
   git clone https://github.com/lwndhrst/home-manager-wsl ~/.config/home-manager
   ```
   ```sh
   nix run home-manager/master -- switch
   ```

4. Update as follows:
   ```sh
   nix flake update && home-manager switch
   ```

## Get OpenGL and Vulkan Apps working on non-NixOS Systems with nixGL

Invoke OpenGL/Vulkan Apps by prefixing the appropriate wrapper (the Intel one seems to work for AMD as well):

- `nixGLIntel <program> <args>`
- `nixGLNvidia <program> <args>`
- `nixGLVulkanIntel <program> <args>`
- `nixGLVulkanNvidia <program> <args>`

```nix
# devShell config for nix develop
{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixgl = {
      url = "github:guibou/nixGL";
    };
  };

  outputs = { self, nixpkgs, nixgl }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nixgl.overlays.default
        ];
      };

    in {
      devShell.${system} = pkgs.mkShell {
        buildInputs = with pkgs; [
          mesa-demos
          pkgs.nixgl.nixGLIntel
        ];

        LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
          xorg.libX11
        ];
      };
    };
}
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
   ```sh
   chsh -s /home/<user>/.nix-profile/bin/zsh
   ```

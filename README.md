# Personal Nix + Home Manager Config for non-NixOS Systems

## Setup

1. Install nix via the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer).
   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --init none
   ```
   Note: you may need to install a few extra packages, such as `curl` or `git`.

2. Initial setup of [Home Manager with Flakes](https://nix-community.github.io/home-manager/index.html#ch-nix-flakes).
   ```sh
   git clone https://github.com/lwndhrst/home-manager-wsl ~/.config/home-manager
   ```
   ```sh
   nix run home-manager/master -- switch
   ```

3. Update as follows:
   ```sh
   nix flake update && home-manager switch
   ```

## Get OpenGL and Vulkan to work on non-NixOS Systems with [nixGL](https://github.com/guibou/nixGL)

Invoke OpenGL/Vulkan programs by prefixing the appropriate wrapper:

- `nixGLIntel <program> <args>`
- `nixGLMesa <program> <args>`
- `nixGLNvidia <program> <args>`
- `nixVulkanIntel <program> <args>`
- `nixVulkanMesa <program> <args>`
- `nixVulkanNvidia <program> <args>`

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
          pkgs.nixgl.nixGLMesa
        ];

        LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
          xorg.libX11
        ];
      };
    };
}
```

## Misc

- For removing Windows PATH and disabling execution of Windows binaries on WSL add the following to `/etc/wsl.conf`:
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

{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # List of available plugins in the overlay (pkgs.vimExtraPlugins):
    # https://github.com/NixNeovim/NixNeovimPlugins/blob/main/plugins.md
    #
    # Plugins are still configured via lua for now:
    # https://github.com/lwndhrst/dotfiles-nvim
    plugins = with pkgs; [
      vimPlugins.plenary-nvim

      # LSP and completion stuff
      vimPlugins.nvim-lspconfig
      vimPlugins.nvim-cmp
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-buffer
      vimPlugins.cmp-path
      vimPlugins.cmp-cmdline
      vimPlugins.cmp_luasnip
      vimPlugins.luasnip

      # Formatter
      vimPlugins.formatter-nvim

      # Treesitter
      vimPlugins.nvim-treesitter

      # If using default treesitter parser dir, all parsers have to be installed from here
      # (vimPlugins.nvim-treesitter.withPlugins (p: with p; [
      #   nix
      #   lua
      #   rust
      #   toml
      #   markdown
      #   javascript
      #   css
      #   html
      # ]))

      # Misc
      vimPlugins.nvim-web-devicons
      vimPlugins.telescope-nvim
      vimPlugins.lualine-nvim
      vimPlugins.dashboard-nvim
      vimPlugins.harpoon
      vimPlugins.nvim-colorizer-lua

      # Latex
      vimPlugins.vimtex

      # Themes
      vimPlugins.rose-pine
    ];
  };
}

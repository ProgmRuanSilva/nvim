# Neovim

My Own Neovim Configuration

### Installation:

```sh
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

Or:

```sh
    git clone git@github.com:ProgmRuanSilva/nvim.git ~/.config/nvim && nvim
```

## Plugins
Over 73 plugins installed

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [LazyGit](https://github.com/kdheepak/lazygit.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Git](https://github.com/lewis6991/gitsigns.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP](https://github.com/neovim/nvim-lspconfig)
- [Syntax](https://github.com/nvim-treesitter/nvim-treesitter)
- [Autopairs](https://github.com/windwp/nvim-autopairs)
- [GitBlame](https://github.com/f-person/git-blame.nvim)
- [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
- [Comment](https://github.com/numToStr/Comment.nvim)
- [Nui](https://github.com/MunifTanjim/nui.nvim)
- [Noice](https://github.com/folke/noice.nvim)
- [Nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [Nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

And Much More

🙋 FAQ I get a warning saying Cannot request projects v2, missing scope
'read:project'

That's expected. The new support for projects v2 support requires the
read:project scope on your GitHub token.

You add the scope by using gh auth refresh -s read:project or you can suppress
this warning by setting the following in your config

```
{
  suppress_missing_scope = {
    projects_v2 = true,
  }
}
```

## Thanks ❤️

- [Nvchad](https://github.com/NvChad/NvChad)

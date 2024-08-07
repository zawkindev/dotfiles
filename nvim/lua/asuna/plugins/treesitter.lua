return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",   -- Run :TSUpdate after installation
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Add your configuration options here
      ensure_installed = { "c", "cpp", "typescript", "go" }, -- Or specify a list of languages
      highlight = {
        enable = true,                                       -- Enable highlighting
      },
    }
  end,
}

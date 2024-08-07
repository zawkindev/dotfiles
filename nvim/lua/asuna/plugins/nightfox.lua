return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      transparent = false,
    },
  },
  config = function(_, opts)
    require('nightfox').setup(opts)
    vim.cmd("colorscheme carbonfox")
  end
}

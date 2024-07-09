return {
"rebelot/kanagawa.nvim",
config=function()
	require('kanagawa').setup({
      		transparent = true,
    	})
      -- Set transparency for various UI elements
      vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi LineNr ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi EndOfBuffer ctermbg=none guibg=none")
      vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
	vim.cmd("colorscheme kanagawa")

end
}

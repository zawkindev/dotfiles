local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
  vim.keymap.set({ 'n', 'x' }, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end)
end)
lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['clangd'] = { 'c', 'cpp' },
    ['tsserver'] = { 'javascript', 'typescript' },
    ['pylsp'] = { 'python' }
  }
})


-- This works, but forces every buffer to be formatted in full on save
-- lsp.on_attach(function(client, bufnr)
--  lsp.buffer_autoformat()
-- end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = false,
  severity_sort = false,
  float = true,
})



local null_ls = require("null-ls")
local null_opts = lsp.build_options('null-ls', {})
-- Note: I might want toremove this in the future
null_ls.setup({
  on_attach = function(client, bufnr)
    print(vim.inspect(client), bufnr)
    local lsp_format_modifications = require("lsp-format-modifications")
    lsp_format_modifications.attach(client, bufnr, { format_on_save = true })
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.black,
  },
})

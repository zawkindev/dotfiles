local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#49464E',
      bg = '#37343A',
    },
    separator_selected = {
      fg = '#49464E',
      bg = '#2d2a2e',
    },
    background = {
      fg = '#aaaaaa',
      bg = '#37343A'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#49464E'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

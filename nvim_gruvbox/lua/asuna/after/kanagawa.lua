require('kanagawa').setup({
      typeStyle = { bold = false },
      colors = {
        palette = {
            sumiInk0 = "#3e3e3e",
            fujiWhite = "#ffffff",
        },
        theme = {
            all = {
                ui = {
		    float = {
                        bg = "none",
                    },
		    bg="none",
                }
            }
        }
    },
    overrides = function(colors)
    return {
      -- Assign a static color to strings
      String = { fg = colors.palette.carpYellow, italic = false },
      -- theme colors will update dynamically when you change theme!
      SomePluginHl = { fg = colors.theme.syn.type, bold = false },
      Bold = { bold = false },
      Special = { bold = false },
    }
  end,
})

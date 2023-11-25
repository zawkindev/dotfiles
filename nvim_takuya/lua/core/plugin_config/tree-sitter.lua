local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "c",
    "gitignore",
    "llvm",
    "nix",
    "rust",
    "zig",
    "cpp",
  },
  autotag = {
    enable = true,
  },
  ts_context_commentstring = {
    enable         = true,
    enable_autocmd = false,
  }
}


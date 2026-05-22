-- Colorscheme: Gruvbox (dark, soft contrast)
return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "soft",
      italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = true,
      },
    })
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  end,
}

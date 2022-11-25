require("mini.comment").setup()
require("mini.cursorword").setup{
  delay = 0
}
require("mini.pairs").setup()
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
require('mini.indentscope').setup{
  draw = {
    delay = 0
  },
  symbol = '│'
}
require('mini.jump').setup{
  delay = {
    highlight = 0
  }
}

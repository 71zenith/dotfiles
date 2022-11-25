local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup{
  signs = {
    delete = {
      text = "契"
    },
    topdelete = {
      text = "契"
    }
  }
}

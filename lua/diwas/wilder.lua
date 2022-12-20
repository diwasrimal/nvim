local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  print("wilder plugin not found")
  return
end

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = { border = 'Normal' },
    border = 'single',
  })
))

wilder.setup({modes = {':', '/', '?'}}) 

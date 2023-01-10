local status, leap  = pcall(require,'leap')
if(status == nil) then
  return
end

leap.leap { target_windows = { vim.fn.win_getid() } }
leap.add_default_mappings()
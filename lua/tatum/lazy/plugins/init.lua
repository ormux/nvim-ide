local P = {}

local dir = "~/.config/nvim/lua/tatum/lazy/plugins"

for file in io.popen("ls " .. dir .. "/*.lua"):lines() do
  if file:match("^.+/(.+)$") == "init.lua" then
    goto continue
  end

  local p = assert(loadfile(file))()
  table.insert(P, p)

  ::continue::
end

return P

local hotkey = require 'hs.hotkey'

local function module_init()
  hotkey.bind(config:get('information.mash', { 'ctrl', 'alt', 'cmd'}), config:get('information.date', 'D'), function()
    hs.alert.show(os.date("%A %B %d, %Y - %I:%M %p"), 4)
  end)
end

return {
  init = module_init
}

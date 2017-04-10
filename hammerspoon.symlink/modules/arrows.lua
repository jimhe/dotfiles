local hotkey = require 'hs.hotkey'
local window = require 'hs.window'

local position = import('utils/position')
local monitors = import('utils/monitors')

local function module_init()
    local mash = config:get("arrows.mash", { "shift", "ctrl" })
    local keys = config:get("arrows.keys", {
        K = "top",
        J = "bottom",
        H = "left",
        L = "right",
        SPACE = "full",
        Y = "top_left",
        C = "middle_three_forths",
        U = "top_right",
        B = "bottom_left",
        N = "bottom_right"
    })

    for key, position_string in pairs(keys) do
        local position_fn = position[position_string]

        if position_fn == nil then
            error("arrow: " .. position_string .. " is not a valid position")
        end

        hotkey.bind(mash, key, function()
            local win = window.focusedWindow()
            if win == nil then
                return
            end

            local screen = win:screen()
            local dimensions = monitors.get_screen_dimensions(screen)
            local newframe = position_fn(dimensions)

            win:setFrame(newframe)
        end)

    end

end

return {
    init = module_init
}

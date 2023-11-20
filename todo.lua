local basalt = require("basalt")
local list = {}



local function addNote(list)
    if list then
        for _,note in ipairs(list) do
            
        end
    end
end

local main = basalt.createFrame()

local button = main
            :addButton()
            :setPosition(4, 4)
            :setText("Click me!")
            :onClick(
                function()
                    basalt.debug("I got clicked!")
                end)


basalt.autoUpdate()
local globals = require("prototypes.globals")
local util = require("prototypes.util")

local items = util.build_items(globals.ore_definitions)
if items and #items > 0 then
	data:extend(items)
end

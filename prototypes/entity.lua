local globals = require("prototypes.globals")
local util = require("prototypes.util")

local entities = util.build_entities(globals.ore_definitions)
if entities and #entities > 0 then
	data:extend(entities)
end

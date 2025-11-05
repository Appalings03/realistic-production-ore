local globals = require("prototypes.globals")
local util = require("prototypes.util")

local techs = util.build_technologies(globals.ore_definitions)
if techs and #techs > 0 then
	data:extend(techs)
end

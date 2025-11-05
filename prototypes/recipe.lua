local globals = require("prototypes.globals")
local util = require("prototypes.util")

local recipes = util.build_recipes(globals.ore_definitions)
if recipes and #recipes > 0 then
	data:extend(recipes)
end

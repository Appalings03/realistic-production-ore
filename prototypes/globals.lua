-- globals.lua
-- Central list of ore-like objects to generate for the realistic_production_ore mod.
-- Add or edit entries here; the util builder will use these to create items, recipes,
-- technologies and resource entities automatically.

local M = {}

--  Example list of ores to create. Add more entries following this template.
--  Fields used by the builders:
--  name            = internal prototype name for the resource entity
--  item            = internal item name produced by mining the resource
--  localized_name  = localization key (array form) to use for the item/entity
--  icon            = path to icon (optional, util will provide a fallback)
--  mining_time     = time to mine (number)
--  map_color       = table {r,g,b} for map color
--  stage_counts    = table for resource stage counts (visual tiers)

M.ore_definitions = {
	{
		name = "realistic-iron-ore",
		item = "realistic-iron-ore",
		localized_name = {"item-name.realistic-iron-ore"},
		icon = "__realistic_production_ore__/graphics/icons/realistic-iron-ore.png",
		mining_time = 1.5,
		map_color = { r = 0.415, g = 0.525, b = 0.580 },
		stage_counts = {15000, 8000, 4000, 2000, 1000, 500, 250, 100},
	},
	{
		name = "realistic-copper-ore",
		item = "realistic-copper-ore",
		localized_name = {"item-name.realistic-copper-ore"},
		icon = "__realistic_production_ore__/graphics/icons/realistic-copper-ore.png",
		mining_time = 1.0,
		map_color = { r = 1.0, g = 0.5, b = 0.0 },
		stage_counts = {15000, 8000, 4000, 2000, 1000, 500, 250, 100},
	},
}

return M

-- util.lua
-- Builder functions that turn entries in globals.ore_definitions into Factorio prototypes.

local util = {}

-- Return the expected asset path inside the shared assets mod for a prototype.
-- Example: util.asset_icon_path("realistic-iron-ore") -> "__realistic_production_assets__/graphics/realistic-iron-ore/icon.png"
function util.asset_icon_path(proto_name, filename)
	filename = filename or "icon.png"
	return "__realistic_production_assets__/graphics/" .. proto_name .. "/" .. filename
end

local function icon_fallback()
	-- Use a base-game placeholder for icons when the mod icon doesn't exist.
	return "realistic_production_ore__/graphics/placeholder-icon.png"
end

-- Resolve the icon path for a definition table `d`.
-- Priority: d.icon (explicit) -> assets mod path (by prototype name) -> fallback
function util.resolve_icon(d)
	if d == nil then return icon_fallback() end
	if d.icon and #d.icon > 0 then
		return d.icon
	end
	-- prefer using the item name if available, otherwise the prototype name
	local base = d.item or d.name or "unknown"
	-- Prefer the asset in the shared assets mod, but if that file is missing in the
	-- development workspace, fall back to a base-game placeholder so the prototype
	-- still has a valid icon.
	local mod_path = util.asset_icon_path(base)

	-- If the shared assets mod is present in the current Factorio load, prefer
	-- using the asset path so prototypes pick up the shared icons. The `mods`
	-- table is provided by Factorio in the data stage; check it safely.
	if type(mods) == "table" and mods["realistic_production_assets"] then
		return mod_path
	end

	-- Otherwise fall back to a base-game icon so the prototype still has a valid image.
	return icon_fallback()
end

function util.build_items(defs)
	local out = {}
	for _, d in ipairs(defs) do
		table.insert(out, {
			type = "item",
			name = d.item,
			icon = util.resolve_icon(d),
			icon_size = 32,
			subgroup = "raw-resource",
			order = "a[raw-resource]-" .. d.item,
			stack_size = 50,
			localised_name = d.localized_name,
		})
	end
	return out
end

function util.build_recipes(defs)
	local out = {}
	for _, d in ipairs(defs) do
		-- Create a simple processing recipe that converts the realistic ore into the base raw resource
		-- (iron-ore or copper-ore) so the rest of the game can use it.
		local result = "iron-ore"
		if string.find(d.name, "copper") then
			result = "copper-ore"
		end

		table.insert(out, {
			type = "recipe",
			name = d.name .. "-processing",
			category = "smelting",
			energy_required = 3.5,
			ingredients = {{d.item, 1}},
			result = result,
			enabled = false,
		})
	end
	return out
end

function util.build_technologies(defs)
	local out = {}
	for _, d in ipairs(defs) do
		table.insert(out, {
			type = "technology",
			name = d.name .. "-processing",
			icon = util.resolve_icon(d),
			icon_size = 32,
			effects = {
				{ type = "unlock-recipe", recipe = d.name .. "-processing" }
			},
			prerequisites = {"automation"},
			unit = {
				count = 50,
				ingredients = { {"automation-science-pack", 1} },
				time = 30
			},
			order = "a-[" .. d.name .. "]",
		})
	end
	return out
end

function util.build_entities(defs)
	local out = {}
	for _, d in ipairs(defs) do
		table.insert(out, {
			type = "resource",
			name = d.name,
			icon = util.resolve_icon(d),
			icon_size = 32,
			flags = {"placeable-neutral"},
			order = "a-b-" .. d.name,
			minable = { mining_time = d.mining_time or 1.0, result = d.item },
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			stage_counts = d.stage_counts or {10000, 4000, 2000, 1000, 500, 250, 100},
			stages = {
				sheet = {
					filename = "__base__/graphics/entity/iron-ore/iron-ore.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					frame_count = 8,
					variation_count = 8,
				}
			},
			map_color = d.map_color or {r = 0.5, g = 0.5, b = 0.5},
		})
	end
	return out
end

return util


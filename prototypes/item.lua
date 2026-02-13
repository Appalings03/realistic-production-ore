-- item.lua

-- Function to generates the item prototypes based on the global definitions
-- @param globals : 
-- {
--   geological_sources,
--   artificial_elements,
--   crustal_rock_deposit,
--   igneous_intrusion,
--   mantle_pipe,
--   hydrothermal_vein,
--   evaporite_basin,
--   brine_reservoir,
--   atmospheric_field,
--   impact_structure,
--   radioactive_zone
-- }

-- Mapping sources
local source_settings = {
    crustal_rock_deposit    = { subgroup = "crustal-rock",    tier = 1, time = 2.0 },
    igneous_intrusion       = { subgroup = "igneous-rock",   tier = 2, time = 4.0 },
    mantle_pipe             = { subgroup = "mantle-rock",    tier = 3, time = 7.0 },
    hydrothermal_vein       = { subgroup = "hydrothermal",   tier = 2, time = 5.0 },
    evaporite_basin         = { subgroup = "evaporite",      tier = 1, time = 2.5 },
    brine_reservoir         = { subgroup = "brine",          tier = 2, time = 3.5 },
    atmospheric_field       = { subgroup = "atmosphere",     tier = 1, time = 1.0 },
    impact_structure        = { subgroup = "impact",        tier = 4, time = 8.0 },
    radioactive_zone        = { subgroup = "radioactive",    tier = 4, time = 10.0 },
    artificial_elements     = { subgroup = "artificial",    tier = 5, time = 12.0 }
}



function generate_items_source(globals)
    local prototypes = {}

    -- Parcours toutes les sources définies
    for source_name, settings in pairs(source_settings) do
        local source_table = globals[source_name]
        if source_table then
            for i, element in ipairs(source_table) do
                -- Normalise Item Name
                local element_name = string.lower(element.name)
                element_name = string.gsub(element_name, " ", "_")

                -- Order generation (ex: a[crustal-rock][1], a[crustal-rock][2])
                local order = string.format("a[%s][%02d]", settings.subgroup, i)

                -- Prototype Factorio item
                local prototype = {
                    type = "item",
                    name = element_name,
                    icon = "__realistic_production__/realistic_production_assets/graphics/" .. element_name .. ".png",
                    icon_size = 64,
                    subgroup = settings.subgroup,
                    order = order,
                    stack_size = 100,
                    localised_description = {"item-description.geological-element"},
                    tier = settings.tier,
                    mining_time = settings.time
                }

                table.insert(prototypes, prototype)
            end
        end
    end

    return prototypes
end

function generate_items_ore(globals)
    local prototypes = {}

    -- Parcours toutes les sources définies
    for source_name, settings in pairs(source_settings) do
        local source_table = globals[source_name]
        if source_table then
            for i, element in ipairs(source_table) do
                -- Normalise Item Name
                local element_name = string.lower(element.name)
                element_name = string.gsub(element_name, " ", "_")

                -- Order generation (ex: a[crustal-rock][1], a[crustal-rock][2])
                local order = string.format("a[%s][%02d]", settings.subgroup, i)

                -- Prototype Factorio item
                local prototype = {
                    type = "item",
                    name = element_name,
                    icon = "__realistic_production__/realistic_production_assets/graphics/" .. element_name .. ".png",
                    icon_size = 64,
                    subgroup = settings.subgroup,
                    order = order,
                    stack_size = 100,
                    localised_description = {"item-description.geological-element"},
                    tier = settings.tier,
                    mining_time = settings.time
                }

                table.insert(prototypes, prototype)
            end
        end
    end

    return prototypes
end

function generate_items_gas(globals)
    local prototypes = {}

    -- Parcours toutes les sources définies
    for source_name, settings in pairs(source_settings) do
        local source_table = globals[source_name]
        if source_table then
            for i, element in ipairs(source_table) do
                -- Normalise Item Name
                local element_name = string.lower(element.name)
                element_name = string.gsub(element_name, " ", "_")

                -- Order generation (ex: a[crustal-rock][1], a[crustal-rock][2])
                local order = string.format("a[%s][%02d]", settings.subgroup, i)

                -- Prototype Factorio item
                local prototype = {
                    type = "item",
                    name = element_name,
                    icon = "__realistic_production__/realistic_production_assets/graphics/" .. element_name .. ".png",
                    icon_size = 64,
                    subgroup = settings.subgroup,
                    order = order,
                    stack_size = 100,
                    localised_description = {"item-description.geological-element"},
                    tier = settings.tier,
                    mining_time = settings.time
                }

                table.insert(prototypes, prototype)
            end
        end
    end

    return prototypes
end


-- Extend the list of prototypes to data
local globals = require("globals")
data:extend(generate_items_gas(globals))
data:extend(generate_items_ore(globals))
data:extend(generate_items_source(globals))


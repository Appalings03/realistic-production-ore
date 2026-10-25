local ore = require("__realistic_production_utils__.utils.ore")

local function load_data(module_path)
    return ore.load_data("__realistic_production_ore__.prototypes." .. module_path)
end

local function create_icon_groups()
    local definitions = load_data("groups.groups_data")
    for _, group in ipairs(definitions.groups) do
        ore.create_group(group)
    end
    for _, subgroup in ipairs(definitions.subgroups) do
        ore.create_subgroup(subgroup)
    end
end

local RESOURCE_FLUID_COLORS = {
    seawater = {{0.18, 0.45, 0.72}, {0.28, 0.62, 0.88}},
    ["lithium-brine"] = {{0.25, 0.68, 0.66}, {0.42, 0.82, 0.78}},
    ["geothermal-water"] = {{0.82, 0.34, 0.16}, {0.95, 0.56, 0.28}},
    ["natural-gas"] = {{0.62, 0.72, 0.80}, {0.78, 0.86, 0.91}},
    air = {{0.72, 0.82, 0.94}, {0.88, 0.93, 1.00}},
}

local ELEMENT_FLUID_COLORS = {
    hydrogen = {{0.72, 0.88, 1.00}, {0.86, 0.94, 1.00}},
    helium = {{0.92, 0.62, 0.70}, {1.00, 0.80, 0.84}},
    nitrogen = {{0.46, 0.64, 0.86}, {0.65, 0.78, 0.94}},
    oxygen = {{0.24, 0.50, 0.90}, {0.45, 0.68, 1.00}},
    fluorine = {{0.48, 0.78, 0.38}, {0.68, 0.90, 0.50}},
    neon = {{0.95, 0.34, 0.25}, {1.00, 0.58, 0.42}},
    chlorine = {{0.60, 0.72, 0.18}, {0.78, 0.86, 0.36}},
    argon = {{0.60, 0.56, 0.82}, {0.78, 0.74, 0.94}},
    bromine = {{0.58, 0.26, 0.16}, {0.78, 0.42, 0.24}},
    krypton = {{0.76, 0.74, 0.86}, {0.90, 0.88, 0.96}},
    xenon = {{0.56, 0.52, 0.78}, {0.75, 0.70, 0.92}},
    mercury = {{0.72, 0.74, 0.78}, {0.88, 0.89, 0.92}},
    radon = {{0.78, 0.62, 0.46}, {0.94, 0.80, 0.64}},
}

local function color(values)
    return {r = values[1], g = values[2], b = values[3]}
end

local function create_item_or_fluid(definition, fluid_colors)
    if definition.type == "fluid" then
        local colors = fluid_colors[definition.name] or {{0.55, 0.66, 0.78}, {0.76, 0.84, 0.92}}
        local fluid = {}
        for key, value in pairs(definition) do
            fluid[key] = value
        end
        fluid.base_color = color(colors[1])
        fluid.flow_color = color(colors[2])
        ore.create_fluid(fluid)
    else
        ore.create_item(definition)
    end
end

local function create_definitions(module_path, fluid_colors)
    for _, definition in ipairs(load_data(module_path)) do
        create_item_or_fluid(definition, fluid_colors)
    end
end

create_icon_groups()
create_definitions("resources.resources_data", RESOURCE_FLUID_COLORS)
create_definitions("resources.elements_data", ELEMENT_FLUID_COLORS)
create_definitions("materials.alloys_data", {})
create_definitions("materials.materials_data", {})
create_definitions("components.components_data", {})
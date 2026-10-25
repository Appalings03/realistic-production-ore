local dev_assets = {
    type = "bool-setting",
    name = "rp-dev-assets",
    setting_type = "startup",
    default_value = true,
    order = "a"
}

local pure_node = {
    type = "bool-setting",
    name = "rp-pure-ore-nodes",
    setting_type = "startup",
    default_value = false,
    order = "b"
}

local ore_density = {
    type = "double-setting",
    name = "rp-ore-density",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 0.1,
    maximum_value = 10.0,
    order = "c"
}

data:extend({dev_assets, pure_node, ore_density})

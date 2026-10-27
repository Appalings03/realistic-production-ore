local dev_assets = {
    type = "bool-setting",
    name = "rp-dev-assets",
    setting_type = "startup",
    default_value = true,
    order = "a"
}

local mixed_ore_patches = {
    type = "bool-setting",
    name = "rp-mixed-ore-patches",
    setting_type = "startup",
    default_value = true,
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

data:extend({dev_assets, mixed_ore_patches, ore_density})

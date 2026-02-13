local pure_node = {
    type = "bool-setting",
    name = "Allow pure ore nodes",
    setting_type = "startup",
    default_value = false, 
    order = "a"
}
local ore_density = {
    type = "double-setting",
    name = "Ore density multiplier",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 0.1,
    maximum_value = 10.0,
    order = "b"
}

data:extend({pure_node, ore_density})
-- example of startup setting
-- {
--    type = "bool-setting",
--    name = "my-mod-enable-feature",
--    setting_type = "startup",
--    default_value = true,
--    order = "a"
--  }
--example of a runtime setting
--  {
--    type = "string-setting",
--    name = "my-mod-user-preference",
--    setting_type = "runtime-per-user",
--    allowed_values = {"option1", "option2", "option3"},
--    default_value = "option1",
--    order = "c"
--  }
-- example of a startup setting
-- exampel of runtime global setting
--  {
--    type = "string-setting",
--    name = "my-mod-user-preference",
--    setting_type = "runtime-per-user",
--    allowed_values = {"option1", "option2", "option3"},
--    default_value = "option1",
--    order = "c"
--  }

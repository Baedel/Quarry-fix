data:extend({
  {
    type = "double-setting",
    name = "quarry-stone-waste-percentage",
    order = "aa",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 0,
    maximum_value = 100
  },
  {
    type = "bool-setting",
    name = "quarry-enable-prod",
    order = "ab",
    setting_type = "startup",
    default_value = "true"
  },
  {
    type = "double-setting",
    name = "quarry-recipe-speed",
    order = "ba",
    setting_type = "startup",
    default_value = 3,
    minimum_value = 1,
    maximum_value = 10
  },
  {
    type = "double-setting",
    name = "quarry-crafting-speed",
    order = "bb",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 1
  },
  {
    type = "double-setting",
    name = "quarry-power-usage",
    order = "bc",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0
  },

})
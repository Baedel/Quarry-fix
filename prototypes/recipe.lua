data:extend({
  {
    type = "recipe",
    name = "quarry",
    ingredients =
    {
      {"iron-plate", 20},
      {"iron-gear-wheel", 10},
      {"electronic-circuit", 20}
    },
    result = "quarry",
    energy_required = 5
  },
  {
    type = "recipe",
    name = "quarry-mk2",
    enabled = false,
    ingredients =
    {
      {"quarry", 2},
      {"steel-plate", 10}
    },
    result = "quarry-mk2",
    energy_required = 10
  },
  {
    type = "recipe",
    name = "quarry-mk3",
    enabled = false,
    ingredients =
    {
      {"quarry-mk2", 2},
      {"steel-plate", 20},
      {"advanced-circuit", 20}
    },
    result = "quarry-mk3",
    energy_required = 15
  }
})
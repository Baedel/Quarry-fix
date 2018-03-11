local speed_mult = settings.startup["quarry-crafting-speed"].value
local power_mult = settings.startup["quarry-power-usage"].value

data:extend({
  {
    type = "recipe-category",
    name = "quarry"
  },
  {
    type = "assembling-machine",
    name = "quarry",
    fast_replaceable_group = "quarry-2x2",
    icon = "__Quarry-fix__/graphics/quarry/quarry-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.4, mining_time = 0.8, result = "quarry"},
    max_health = 200,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
    animation =
    {
      filename = "__Quarry-fix__/graphics/quarry/quarry-animation.png",
      priority = "high",
      width = 128,
      height = 128,
      frame_count = 25,
      line_length = 5,
    },
    crafting_categories = {"quarry"},
    crafting_speed = 0.75 * speed_mult,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.1
    },
    energy_usage = (45 * power_mult).."kW",
    ingredient_count = 1,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  },
  {
    type = "assembling-machine",
    name = "quarry-mk2",
    fast_replaceable_group = "quarry-2x2",
    icon = "__Quarry-fix__/graphics/quarry-mk2/quarry-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.6, mining_time = 1.0, result = "quarry-mk2"},
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
    animation =
    {
      filename = "__Quarry-fix__/graphics/quarry-mk2/quarry-animation.png",
      priority = "high",
      width = 128,
      height = 128,
      frame_count = 25,
      line_length = 5,
    },
    crafting_categories = {"quarry"},
    crafting_speed = 1.5 * speed_mult,
    module_specification =
    {
      module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.1
    },
    energy_usage = (105 * power_mult).."kW",
    ingredient_count = 1,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  },
  {
    type = "assembling-machine",
    name = "quarry-mk3",
    fast_replaceable_group = "quarry-3x3",
    icon = "__Quarry-fix__/graphics/quarry-mk3/quarry-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.8, mining_time = 1.2, result = "quarry-mk3"},
    max_health = 500,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    animation =
    {
      filename = "__Quarry-fix__/graphics/quarry-mk3/quarry-horizontal.png",
      priority = "high",
      width = 128,
      height = 128,
      frame_count = 16,
      line_length = 16,
      shift = {0.35, -0.1},
      animation_speed = 0.8
    },
    crafting_categories = {"quarry"},
    crafting_speed = 2.5 * speed_mult,
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.1
    },
    energy_usage = (165 * power_mult).."kW",
    ingredient_count = 1,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  }
})

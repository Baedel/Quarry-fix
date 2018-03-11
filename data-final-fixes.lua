-- energy cost override
local energyRequired = {
  ["crude-oil"] = 5,   -- equals 2/s in quarry mk3
  ["uranium-ore"] = 35
}

-- list of resources unavailable in quarries
local resourceBlacklist = {
  ["ground-water"] = true   -- bob's groundwater
}

for k, resource in pairs(data.raw["resource"]) do
  -- check valid minable resource
  if  not resource.minable or resourceBlacklist[resource.name] or string.find(resource.name, "infinite") then
    goto skipResource
  end

  local energy = energyRequired[resource.name] or settings.startup["quarry-recipe-speed"].value * resource.minable.hardness * resource.minable.mining_time

  local ingredients = {}
  -- resources requiring fluids for mining (e.g. uranium-ore)
  if resource.minable.required_fluid then
    table.insert(ingredients, {type="fluid", name=resource.minable.required_fluid, amount=resource.minable.fluid_amount})
  end

  local recipeName = "quarry-"..resource.name
  -- generate recipe
  local recipe = {
    type = "recipe",
    name = recipeName,
    localised_name = {"recipe-name.quarry-recipe", {"autoplace-control-names." .. resource.name}},
    category = "quarry",
    ingredients = ingredients,
    icon = resource.icon,
    icon_size = 32,
    energy_required = energy,
    subgroup = "raw-resource",
    order = "a"
  }

  if resource.minable.required_fluid then
    if resource.minable.result then
      recipe.results = { {type = "item", name = resource.minable.result, amount = resource.minable.fluid_amount, probability = 1 } }
    end
  elseif resource.minable.results then
    recipe.results = table.deepcopy(resource.minable.results)
  elseif resource.minable.result then
    recipe.results = { {type = "item", name = resource.minable.result, amount = 1, probability = 1} } -- fluids always are results?
  else
    goto skipResource
  end

  -- fix icon and name
  if resource.minable.results and resource.minable.results[1].type then
    recipe.localised_name = { "recipe-name.quarry-recipe", {resource.minable.results[1].type.."-name." .. resource.minable.results[1].name} }
    local result = data.raw[resource.minable.results[1].type][resource.minable.results[1].name]
    if result then
      if result.icon then
        recipe.icon = result.icon
      elseif result.icons then
        recipe.icon = nil
        recipe.icons = result.icons
      end
    end
  end

  -- add stone residue
  if settings.startup["quarry-stone-waste-percentage"].value > 0.0 and recipe.results[1].name ~= "stone" then    
    log("adding "..settings.startup["quarry-stone-waste-percentage"].value.."% stone waste to "..recipe.results[1].name)
    recipe.results[1].probability = 1 - settings.startup["quarry-stone-waste-percentage"].value / 100
    table.insert(recipe.results, {type = "item", name = "stone", amount = 1, probability = settings.startup["quarry-stone-waste-percentage"].value / 100} )
  end

  data:extend({recipe})
  
  if settings.startup["quarry-enable-prod"].value then
    -- allow productivity
    table.insert(data.raw.module["productivity-module"].limitation, recipeName)
    table.insert(data.raw.module["productivity-module-2"].limitation, recipeName)
    table.insert(data.raw.module["productivity-module-3"].limitation, recipeName)
  end
  
  ::skipResource::

end
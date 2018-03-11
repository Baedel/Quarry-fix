for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  
  if technologies["advanced-material-processing"].researched then
    recipes["quarry-mk2"].enabled = true
  end
  if technologies["advanced-material-processing-2"].researched then
    recipes["quarry-mk3"].enabled = true
  end
end
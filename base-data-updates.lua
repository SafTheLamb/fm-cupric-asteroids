local frep = require("__fdsl__.lib.recipe")

local asteroid_types = {"metallic", "carbonic", "oxide", "cupric"}

-------------------------------------------------------------------------- Advanced asteroid crushing

local ore_icons = {
  ["iron-ore"] = {"__base__/graphics/icons/iron-ore.png", "__base__/graphics/icons/iron-ore-2.png", "__base__/graphics/icons/iron-ore-1.png"},
  ["copper-ore"] = {"__base__/graphics/icons/copper-ore.png", "__base__/graphics/icons/copper-ore-2.png", "__base__/graphics/icons/copper-ore-1.png"},
  ["uranium-ore"] = {"__base__/graphics/icons/uranium-ore.png", "__base__/graphics/icons/uranium-ore-2.png", "__base__/graphics/icons/uranium-ore-3.png"},
  ["tungsten-ore"] = {"__space-age__/graphics/icons/tungsten-ore.png", "__space-age__/graphics/icons/tungsten-ore-2.png", "__space-age__/graphics/icons/tungsten-ore-3.png"},
  ["holmium-ore"] = {"__space-age__/graphics/icons/holmium-ore.png", "__space-age__/graphics/icons/holmium-ore.png", "__space-age__/graphics/icons/holmium-ore.png"},
  ["stone"] = {"__base__/graphics/icons/stone.png", "__base__/graphics/icons/stone-1.png", "__base__/graphics/icons/stone-3.png"}
}

local function update_advanced_asteroid_crushing(asteroid_type, main_product, default_byproduct)
  local setting_name_root = "cupric-asteroids-"..asteroid_type
  local recipe_name = "advanced-"..asteroid_type.."-asteroid-crushing"

  local new_byproducts = {}
  local byproduct = settings.startup[setting_name_root.."-byproduct"].value
  if byproduct ~= "copper-ore" then
    new_byproducts[1] = byproduct
    frep.replace_result(recipe_name, default_byproduct, byproduct)
  end

  local triproduct = settings.startup["cupric-asteroids-metallic-triproduct"].value
  if triproduct ~= "none" and triproduct ~= byproduct then
    new_byproducts[2] = triproduct
    local byproduct_result = frep.scale_result(recipe_name, byproduct, {amount=0.5})
    frep.add_result(recipe_name, {type="item", name=triproduct, amount=byproduct_result.amount})
  end

  if #new_byproducts > 0 then
    local recipe = data.raw.recipe[recipe_name]
    recipe.icons = {}
    local has_triproduct = (new_byproducts[2] ~= nil)
    local product_1 = has_triproduct and byproduct or main_product
    local product_2 = has_triproduct and new_byproducts[2] or new_byproducts[1]
    local item = data.raw.item[asteroid_type.."-asteroid-chunk"]

    recipe.icons = {
      {icon=ore_icons[product_1][2], icon_size=64, scale=0.25, shift={-8,-8}, draw_background=false},
      {icon=ore_icons[product_2][2], icon_size=64, scale=0.25, shift={8,-8}, draw_background=false},
      {icon=ore_icons[product_1][1], icon_size=64, scale=0.25, shift={-8,8}, draw_background=true},
      {icon=ore_icons[product_2][1], icon_size=64, scale=0.25, shift={8,8}, draw_background=true},
      {icon=item.icon, icon_size=64, scale=0.45, draw_background=true},
    }
  end
end

update_advanced_asteroid_crushing("cupric", "copper-ore", "uranium-ore")
update_advanced_asteroid_crushing("metallic", "iron-ore", "copper-ore")

-------------------------------------------------------------------------- Asteroid reprocessing

frep.add_result("metallic-asteroid-reprocessing", {type="item", name="cupric-asteroid-chunk", amount=1, probability=0.2})
frep.add_result("carbonic-asteroid-reprocessing", {type="item", name="cupric-asteroid-chunk", amount=1, probability=0.2})
frep.add_result("oxide-asteroid-reprocessing", {type="item", name="cupric-asteroid-chunk", amount=1, probability=0.2})
if settings.startup["cupric-asteroids-rebalanced-reprocessing"].value then
  for _,asteroid_type in pairs(asteroid_types) do
    local recipe = data.raw.recipe[asteroid_type.."-asteroid-reprocessing"]
    local ingredient_name = asteroid_type.."-asteroid-chunk"
    for _,result in pairs(recipe.results) do
      result.probability = result.name == ingredient_name and 0.35 or 0.15
    end
  end
end

-------------------------------------------------------------------------- Space science

if settings.startup["cupric-asteroids-modify-science"].value then
  frep.replace_ingredient("space-science-pack", "iron-plate", "electronic-circuit")
end

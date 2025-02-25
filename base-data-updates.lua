local frep = require("__fdsl__.lib.recipe")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local asteroid_types = {"metallic", "carbonic", "oxide", "cupric"}

-------------------------------------------------------------------------- Recipe changes

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

local new_byproducts = {}
local metallic_byproduct = settings.startup["cupric-asteroids-metallic-byproduct"].value
if metallic_byproduct ~= "copper-ore" then
  new_byproducts[1] = metallic_byproduct
  frep.replace_result("advanced-metallic-asteroid-crushing", "copper-ore", metallic_byproduct)
end

local metallic_triproduct = settings.startup["cupric-asteroids-metallic-triproduct"].value
if metallic_triproduct ~= "none" and metallic_triproduct ~= metallic_byproduct then
  new_byproducts[2] = metallic_triproduct
  local byproduct_result = frep.scale_result("advanced-metallic-asteroid-crushing", metallic_byproduct, {amount=0.5})
  frep.add_result("advanced-metallic-asteroid-crushing", {type="item", name=metallic_triproduct, amount=byproduct_result.amount})
end

if #new_byproducts > 0 then
  local ore_icons = {
    ["iron-ore"] = {"__base__/graphics/icons/iron-ore.png", "__base__/graphics/icons/iron-ore-2.png", "__base__/graphics/icons/iron-ore-1.png"},
    ["copper-ore"] = {"__base__/graphics/icons/copper-ore.png", "__base__/graphics/icons/copper-ore-2.png", "__base__/graphics/icons/copper-ore-1.png"},
    ["uranium-ore"] = {"__base__/graphics/icons/uranium-ore.png", "__base__/graphics/icons/uranium-ore-2.png", "__base__/graphics/icons/uranium-ore-3.png"},
    ["tungsten-ore"] = {"__space-age__/graphics/icons/tungsten-ore.png", "__space-age__/graphics/icons/tungsten-ore-2.png", "__space-age__/graphics/icons/tungsten-ore-3.png"},
    ["holmium-ore"] = {"__space-age__/graphics/icons/holmium-ore.png", "__space-age__/graphics/icons/holmium-ore.png", "__space-age__/graphics/icons/holmium-ore.png"},
    ["stone"] = {"__base__/graphics/icons/stone.png", "__base__/graphics/icons/stone-1.png", "__base__/graphics/icons/stone-3.png"}
  }

  local recipe = data.raw.recipe["advanced-metallic-asteroid-crushing"]
  recipe.icons = {}
  local has_triproduct = (new_byproducts[2] ~= nil)
  local product_1 = has_triproduct and metallic_byproduct or "iron-ore"
  local product_2 = has_triproduct and new_byproducts[2] or new_byproducts[1]

  recipe.icons = {
    {icon=ore_icons[product_1][2], icon_size=64, scale=0.25, shift={-8,-8}, draw_background=false},
    {icon=ore_icons[product_2][2], icon_size=64, scale=0.25, shift={8,-8}, draw_background=false},
    {icon=ore_icons[product_1][1], icon_size=64, scale=0.25, shift={-8,8}, draw_background=true},
    {icon=ore_icons[product_2][1], icon_size=64, scale=0.25, shift={8,8}, draw_background=true},
    {icon="__space-age__/graphics/icons/metallic-asteroid-chunk.png", icon_size=64, scale=0.45, draw_background=true},
  }
end

-------------------------------------------------------------------------- Compatibility

if mods["Rocky-Asteroids"] then
  frep.add_result("cupric-asteroid-crushing", {type="item", name="stone", amount=5, probability=0.3})
end

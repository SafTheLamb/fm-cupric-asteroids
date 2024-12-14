local frep = require("__fdsl__.lib.recipe")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local asteroid_types = {"metallic", "carbonic", "oxide", "cupric"}

-------------------------------------------------------------------------- Recipe changes

frep.add_result("metallic-asteroid-reprocessing", {type="item", name="cupric-asteroid-chunk", amount=1, probability=0.2})
frep.add_result("carbonic-asteroid-reprocessing", {type="item", name="cupric-asteroid-chunk", amount=1, probability=0.2})
frep.add_result("oxide-asteroid-reprocessing", {type="item", name="cupric-asteroid-chunk", amount=1, probability=0.2})
for _,asteroid_type in pairs(asteroid_types) do
  local recipe = data.raw.recipe[asteroid_type.."-asteroid-reprocessing"]
  local ingredient_name = asteroid_type.."-asteroid-chunk"
  for _,result in pairs(recipe.results) do
    result.probability = result.name == ingredient_name and 0.35 or 0.15
  end
end

-------------------------------------------------------------------------- Asteroid 

local asteroid_map = {
  ["metallic-asteroid-chunk"] = "cupric-asteroid-chunk",
  ["small-metallic-asteroid"] = "small-cupric-asteroid",
  ["medium-metallic-asteroid"] = "medium-cupric-asteroid",
  ["big-metallic-asteroid"] = "big-cupric-asteroid",
  ["huge-metallic-asteroid"] = "huge-cupric-asteroid"
}

local asteroid_id = 5

local function add_cupric_asteroid_spawn_definition(prototype)
  if not prototype.asteroid_spawn_definitions then return end
  for i = #prototype.asteroid_spawn_definitions, 1, -1 do
    local old_definition = prototype.asteroid_spawn_definitions[i]
    local new_asteroid_name = asteroid_map[old_definition.asteroid]
    if new_asteroid_name then
      table.insert(prototype.asteroid_spawn_definitions, {
        asteroid = new_asteroid_name,
        type = old_definition.type,
        probability = old_definition.probability,
        speed = old_definition.speed,
        spawn_points = old_definition.spawn_points,
        angle_when_stopped = old_definition.angle_when_stopped
      })
    end
  end
end

for _,planet in pairs(data.raw.planet) do
  add_cupric_asteroid_spawn_definition(planet)
end

for _,location in pairs(data.raw["space-location"]) do
  add_cupric_asteroid_spawn_definition(location)
end

for _,connection in pairs(data.raw["space-connection"]) do
  add_cupric_asteroid_spawn_definition(connection)
end

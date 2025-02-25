require("prototypes.technology-updates")

-------------------------------------------------------------------------- Asteroid spawns

local asteroid_map = {
  ["metallic-asteroid-chunk"] = "cupric-asteroid-chunk",
  ["small-metallic-asteroid"] = "small-cupric-asteroid",
  ["medium-metallic-asteroid"] = "medium-cupric-asteroid",
  ["big-metallic-asteroid"] = "big-cupric-asteroid",
  ["huge-metallic-asteroid"] = "huge-cupric-asteroid"
}

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

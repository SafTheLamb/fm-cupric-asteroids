local math2d = require("math2d")

function on_script_trigger_effect(event)
  if event.effect_id == "cadm-smart-round-fired" then
    local surface = game.surfaces[event.surface_index]

    local ammo_stack = nil
    if event.source_entity then
      local inventory = event.source_entity.get_inventory(defines.inventory.turret_ammo)
      if inventory then
        ammo_stack = inventory.find_item_stack("smart-rounds-magazine")
      end
    end
    game.print((ammo_stack and "yay" or "nil"))

    local target_position = event.target_entity and event.target_entity.position or event.target_position
    if not event.target_entity then
      local asteroids = surface.find_entities_filtered{
        type = "asteroid",
        position = target_position,
        radius = 2
      }
      local shortest_distance_squared = 1000.0
      for _,asteroid in pairs(asteroids) do
        local distance_squared = math2d.position.distance_squared(asteroid.position, target_position)
        if distance_squared < shortest_distance_squared then
          event.target_entity = asteroid
        end
      end
    end
    local vector = math2d.position.subtract(target_position, event.source_position)

    local projectile = surface.create_entity{
      name = "smart-rounds-magazine",
      source = event.source_entity,
      position = event.source_position,
      force = event.source_entity and event.source_entity.force,
      target = event.target_entity or event.target_position,
      cause = event.cause_entity,
      item = ammo_stack,
      speed = 0.5
    }

    game.print("source:"..(event.source_entity and event.source_entity.name or nil))
    game.print("cause:"..(event.cause_entity and event.cause_entity.name or nil))
    if projectile then
      projectile.orientation = math.atan2(-vector.x, vector.y) / (2*math.pi) + 0.58 - 0.16 * math.random()
      game.print(projectile.force)
      if projectile.force then
        game.print(projectile.force.get_ammo_damage_modifier("bullet"))
      end
    end
  end
end

script.on_event(defines.events.on_script_trigger_effect, on_script_trigger_effect)

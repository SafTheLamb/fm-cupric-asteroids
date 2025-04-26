-- local math2d = require("math2d")

-- local function get_damage_modifier(projectile)
--   local modifier_data = storage.smart_round_damage_modifier[projectile.name]
--   local damage_scalar = 1 + projectile.force.get_ammo_damage_modifier("bullet")
--   if modifier_data.double_modify then
--     damage_scalar = damage_scalar * damage_scalar
--   end
--   return modifier_data.quality_scalar * damage_scalar
-- end

-- local function get_extra_damage_amount(projectile, target)
--   local damage_amount = storage.smart_round_damage_amount * (get_damage_modifier(projectile) - 1)-- * (1+.3*projectile.quality.level) * damage_increase
--   local damage_resistance = target.prototype.resistances["physical"]
--   if damage_resistance then
--     damage_amount = damage_amount + math.min(damage_resistance.decrease, storage.smart_round_damage_amount)
--   end
--   return damage_amount
-- end

-- function on_script_trigger_effect(event)
--   if event.effect_id == "cadm-smart-round-fired" then
--     local surface = game.surfaces[event.surface_index]

--     local quality = "normal"
--     local projectile_name = "smart-rounds-magazine"
--     if event.source_entity then
--       local inventory = event.source_entity.get_inventory(defines.inventory.turret_ammo)
--       if inventory then
--         for i=1,#inventory do
--           if inventory[i].name == "smart-rounds-magazine" then
--             quality = inventory[i].quality.name
--             break
--           end
--         end
--       end
      
--       if event.source_entity.type == "ammo-turret" then
--         projectile_name = "smart-rounds-magazine-turret-"..quality
--       else
--         projectile_name = "smart-rounds-magazine-"..quality
--       end
--     end

--     local target_position = event.target_entity and event.target_entity.position or event.target_position
--     if not event.target_entity then
--       local asteroids = surface.find_entities_filtered{
--         type = "asteroid",
--         position = event.target_position,
--         radius = 2
--       }
--       local shortest_distance_squared = 1000.0
--       for _,asteroid in pairs(asteroids) do
--         local distance_squared = math2d.position.distance_squared(asteroid.position, target_position)
--         if distance_squared < shortest_distance_squared then
--           event.target_entity = asteroid
--         end
--       end
--     end

--     local projectile = surface.create_entity{
--       name = projectile_name,
--       source = event.source_entity,
--       position = event.source_position,
--       force = event.source_entity and event.source_entity.force,
--       target = event.target_entity or event.target_position,
--       cause = event.cause_entity,
--       quality = quality,
--       speed = 0.5
--     }
    
--     if projectile then
--       local vector = math2d.position.subtract(target_position, event.source_position)
--       projectile.orientation = math.atan2(-vector.x, vector.y) / (2*math.pi) + 0.5 + 0.08 - 0.16 * math.random()
--     end
--   elseif event.effect_id == "cadm-smart-round-hit" then
--     local projectile = event.source_entity
--     local target = event.target_entity
--     if projectile and target then
--       target.damage(get_extra_damage_amount(projectile, target), projectile.force, "physical", projectile)
--     end
--   end
-- end

-- local function on_configuration_changed(change_data)
--   storage.smart_round_base_damage = 10
--   storage.smart_round_damage_modifier = {}

--   storage.smart_round_damage_modifier["smart-rounds-magazine"] = 0
--   for _,quality in pairs(prototypes.quality) do
--     storage.smart_round_damage_modifier["smart-rounds-magazine-"..quality.name] = {quality_scalar=1+0.3*quality.level}
--     storage.smart_round_damage_modifier["smart-rounds-magazine-turret-"..quality.name] = {quality_scalar=1+0.3*quality.level, double_modify=true}
--   end
-- end

-- script.on_configuration_changed(on_configuration_changed)

-- script.on_event(defines.events.on_script_trigger_effect, on_script_trigger_effect)

-- local function set_smart_rounds_damage(amount)
--   storage.smart_round_damage_amount = amount
-- end

-- remote.add_interface("cupric-asteroids", {
--   set_smart_rounds_damage = set_smart_rounds_damage
-- })

local math2d = require("math2d")

local ammo_inventory_index = {
  ["ammo-turret"] = defines.inventory.turret_ammo,
  ["character"] = defines.inventory.character_ammo,
  ["car"] = defines.inventory.car_ammo,
  ["spider-vehicle"] = defines.inventory.spider_ammo
}

local has_gun_index = {
  ["character"] = true,
  ["car"] = true,
  ["spider-vehicle"] = true
}

local function get_ammo_quality_modifier(source_entity)
  if not source_entity then return 1 end
  local inventory_index = ammo_inventory_index[source_entity.type]
  if inventory_index then
    local inventory = source_entity.get_inventory(inventory_index)
    if inventory then
      if has_gun_index[source_entity.type] then
        local item_stack = inventory[source_entity.selected_gun_index]
        if item_stack then
          return 1 + 0.3*item_stack.quality.level
        end
      else
        for i=1,#inventory do
          if inventory[i].name == "smart-rounds-magazine" then
            return 1 + 0.3*inventory[i].quality.level
          end
        end
      end
    end
  end
  return 1
end

local function get_bonus_damage_modifier(source_entity)
  if source_entity then
    local damage_scalar = 1 + source_entity.force.get_ammo_damage_modifier("bullet")
    if source_entity.type == "ammo-turret" then
      return damage_scalar * (1 + source_entity.force.get_turret_attack_modifier(source_entity.name))
    else
      return damage_scalar
    end
  end
  return 1
end

function on_script_trigger_effect(event)
  if event.effect_id == "cadm-smart-round-fired" then
    local surface = game.surfaces[event.surface_index]

    if not event.target_entity then
      if event.source_entity and event.source_entity.shooting_target then
        event.target_entity = event.source_entity.shooting_target
      end
    end

    local projectile = surface.create_entity{
      name = "smart-rounds-magazine",
      source = event.source_entity,
      position = event.source_position,
      force = event.source_entity and event.source_entity.force,
      target = event.target_entity or event.target_position,
      cause = event.cause_entity,
      base_damage_modifiers = {damage_modifier=get_ammo_quality_modifier(event.source_entity)},
      bonus_damage_modifiers = {damage_modifier=get_bonus_damage_modifier(event.source_entity)},
      speed = 0.5
    }

    if projectile then
      local target_position = event.target_entity and event.target_entity.position or event.target_position
      local vector = math2d.position.subtract(target_position, event.source_position)
      projectile.orientation = math.atan2(-vector.x, vector.y) / (2*math.pi) + 0.5 + 0.08 - 0.16 * math.random()
    end
  end
end

local function on_configuration_changed(change_data)
  storage.smart_round_base_damage = 10
end

script.on_configuration_changed(on_configuration_changed)

script.on_event(defines.events.on_script_trigger_effect, on_script_trigger_effect)

local function set_smart_round_damage(amount)
  storage.smart_round_damage_amount = amount
end

remote.add_interface("cupric-asteroids", {
  set_smart_rounds_damage = set_smart_round_damage
})

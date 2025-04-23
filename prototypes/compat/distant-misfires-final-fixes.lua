-- TODO: homing bullets DO NOT WORK for reasons beyond my comprehension

if mods["distant-misfires"] and settings.startup["cupric-asteroids-military"].value then
  for _,action in ipairs(data.raw.ammo["smart-rounds-magazine"].ammo_type.action) do
    for _,delivery in ipairs(action.action_delivery) do
      if delivery.type == "projectile" then
        delivery.type = "instant"
        delivery.target_effects = {
          type = "script",
          effect_id = "cadm-smart-round-fired"
        }
        break
      end
    end
  end

  -- Insert dummy action to show the damage amount
  table.insert(data.raw.ammo["smart-rounds-magazine"].ammo_type.action, {
    type = "direct",
    repeat_count = 0,
    action_delivery = {
      type = "projectile",
      projectile = "smart-rounds-magazine",
      starting_speed = 0
    }
  })

  -- table.remove(data.raw.ammo["smart-rounds-magazine"].ammo_type.action, 1)

  data.raw.ammo["smart-rounds-magazine"].ammo_type.target_type = "entity"
  data.raw.projectile["smart-rounds-magazine"].direction_only = false
  -- data.raw.projectile["smart-rounds-magazine"].hit_at_collision_position = false
  data.raw.projectile["smart-rounds-magazine"].turning_speed_increases_exponentially_with_projectile_speed = true
  data.raw.projectile["smart-rounds-magazine"].acceleration = 0.08
  data.raw.projectile["smart-rounds-magazine"].turn_speed = 0.003
end

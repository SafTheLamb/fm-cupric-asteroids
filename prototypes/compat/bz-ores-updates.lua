if mods["bztin"] and settings.startup["cupric-asteroids-tin"].value then
  if data.raw.recipe["metallic-asteroid-crushing-tin"] then
    data.raw.recipe["metallic-asteroid-crushing-tin"].hidden = true
  end
end

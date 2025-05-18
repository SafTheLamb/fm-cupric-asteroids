local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("space-platform", "cupric-asteroid-crushing")
ftech.add_unlock("advanced-asteroid-processing", "advanced-cupric-asteroid-crushing")
ftech.add_unlock("asteroid-reprocessing", "cupric-asteroid-reprocessing")
table.insert(data.raw.technology["asteroid-productivity"].effects,
  {type="change-recipe-productivity", recipe="cupric-asteroid-crushing", change=0.1})
table.insert(data.raw.technology["asteroid-productivity"].effects,
  {type="change-recipe-productivity", recipe="advanced-cupric-asteroid-crushing", change=0.1})

if mods["bztin"] and settings.startup["cupric-asteroids-tin"].value then
  ftech.add_unlock("space-science-pack", "cupric-asteroid-crushing-tin")
  table.insert(data.raw.technology["asteroid-productivity"].effects,
    {type="change-recipe-productivity", recipe="cupric-asteroid-crushing-tin", change=0.1})
end

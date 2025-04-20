local frep = require("__fdsl__.lib.recipe")

if mods["Rocky-Asteroids"] then
  frep.add_result("cupric-asteroid-crushing", {type="item", name="stone", amount=5, probability=0.3})
end

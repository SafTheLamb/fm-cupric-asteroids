if settings.startup["cupric-asteroids-military"].value then
  data:extend({
    {
      type = "technology",
      name = "space-military",
      icon = "__cupric-asteroids__/graphics/technology/space-military.png",
      icon_size = 256,
      effects = {
        {type="unlock-recipe", recipe="smart-rounds-magazine"},
      },
      prerequisites = {"space-science-pack", "rocketry"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"space-science-pack", 1}
        },
        time = 30
      }
    },
  })
end

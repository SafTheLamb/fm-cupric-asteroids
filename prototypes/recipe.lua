data:extend({
  {
    type = "recipe",
    name = "cupric-asteroid-crushing",
    icon = "__cupric-asteroids__/graphics/icons/cupric-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-a-ab",
    auto_recycle = false,
    enabled = false,
    ingredients = {
      {type = "item", name = "cupric-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results = {
      {type = "item", name = "copper-ore", amount = 10},
      {type = "item", name = "cupric-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "advanced-cupric-asteroid-crushing",
    localised_name = {"recipe-name.advanced-cupric-asteroid-crushing"},
    icon = "__cupric-asteroids__/graphics/icons/advanced-cupric-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "c-a-bb",
    auto_recycle = false,
    enabled = false,
    ingredients = {
      {type = "item", name = "cupric-asteroid-chunk", amount = 1}
    },
    energy_required = 5,
    results = {
      {type = "item", name = "copper-ore", amount = 5},
      {type = "item", name = "uranium-ore", amount = 2},
      {type = "item", name = "cupric-asteroid-chunk", amount = 1, probability = 0.05}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "cupric-asteroid-reprocessing",
    icon = "__cupric-asteroids__/graphics/icons/cupric-asteroid-reprocessing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-b-ab",
    auto_recycle = false,
    enabled = false,
    ingredients = {{type="item", name="cupric-asteroid-chunk", amount=1}},
    energy_required = 2,
    results = {
      {type="item", name = "cupric-asteroid-chunk", amount=1, probability=0.4},
      {type="item", name = "metallic-asteroid-chunk", amount=1, probability=0.2},
      {type="item", name = "carbonic-asteroid-chunk", amount=1, probability=0.2},
      {type="item", name = "oxide-asteroid-chunk", amount=1, probability=0.2}
    },
    allow_productivity = false,
    allow_decomposition = false
  },
})

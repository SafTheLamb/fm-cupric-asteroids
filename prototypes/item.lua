local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "cupric-asteroid-chunk",
    icon = "__wood-universe-assets__/graphics/icons/cupric-asteroid-chunk.png",
    subgroup = "space-material",
    order = "a[metallic]b-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg
  },
})

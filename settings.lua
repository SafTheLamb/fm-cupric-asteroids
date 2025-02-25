data:extend({
  {
    type = "bool-setting",
    name = "cupric-asteroids-rebalanced-reprocessing",
    setting_type = "startup",
    default_value = true,
  },
  -- choose the byproduct for advanced metallic asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-byproduct",
    setting_type = "startup",
    allowed_values = {"uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore"
  },
  -- choose a third byproduct for advanced metallic asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none"
  }
})

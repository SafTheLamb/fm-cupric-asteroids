data:extend({
  -- choose the byproduct for advanced cupric asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-cupric-byproduct",
    setting_type = "startup",
    allowed_values = {"iron-ore", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore"
  },
  -- choose a third product for advanced cupric asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-cupric-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none"
  },
  -- choose the byproduct for advanced metallic asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-byproduct",
    setting_type = "startup",
    allowed_values = {"copper-ore", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore"
  },
  -- choose a third product for advanced metallic asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none"
  },
  {
    type = "bool-setting",
    name = "cupric-asteroids-rebalanced-reprocessing",
    setting_type = "startup",
    default_value = true,
  },
})

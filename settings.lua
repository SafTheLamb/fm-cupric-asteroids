data:extend({
  {
    type = "bool-setting",
    name = "cupric-asteroids-modify-science",
    setting_type = "startup",
    default_value = true,
    order = "a[vanilla]-a[science]",
  },
  {
    type = "bool-setting",
    name = "cupric-asteroids-military",
    setting_type = "startup",
    default_value = true,
    order = "b[military]",
  },
  -- choose the byproduct for advanced cupric asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-cupric-byproduct",
    setting_type = "startup",
    allowed_values = {"iron-ore", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore",
    order = "c[asteroids]-a[cupric]-b[byproduct]",
  },
  -- choose a third product for advanced cupric asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-cupric-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none",
    order = "c[asteroids]-a[cupric]-c[triproduct]",
  },
  -- choose the byproduct for advanced metallic asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-byproduct",
    setting_type = "startup",
    allowed_values = {"copper-ore", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore",
    order = "c[asteroids]-b[metallic]-b[byproduct]",
  },
  -- choose a third product for advanced metallic asteroid crushing
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none",
    order = "c[asteroids]-b[metallic]-c[triproduct]",
  },
  {
    type = "bool-setting",
    name = "cupric-asteroids-rebalanced-reprocessing",
    setting_type = "startup",
    default_value = true,
    order = "c[asteroids]-c[reprocessing]",
  }
})

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
    order = "a[vanilla]-b[military]",
  },
  {
    type = "string-setting",
    name = "cupric-asteroids-cupric-byproduct",
    setting_type = "startup",
    allowed_values = {"iron-ore", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore",
    order = "b[asteroids]-a[cupric]-b[byproduct]",
  },
  {
    type = "string-setting",
    name = "cupric-asteroids-cupric-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none",
    order = "b[asteroids]-a[cupric]-c[triproduct]",
  },
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-byproduct",
    setting_type = "startup",
    allowed_values = {"copper-ore", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "uranium-ore",
    order = "b[asteroids]-b[metallic]-b[byproduct]",
  },
  {
    type = "string-setting",
    name = "cupric-asteroids-metallic-triproduct",
    setting_type = "startup",
    allowed_values = {"none", "uranium-ore", "tungsten-ore", "holmium-ore", "stone"},
    default_value = "none",
    order = "b[asteroids]-b[metallic]-c[triproduct]",
  },
  {
    type = "bool-setting",
    name = "cupric-asteroids-rebalanced-reprocessing",
    setting_type = "startup",
    default_value = true,
    order = "b[asteroids]-c[reprocessing]",
  }
})

if mods["bztitanium"] then
  table.insert(data.raw["string-setting"]["cupric-asteroids-cupric-byproduct"].allowed_values, "titanium-ore")
  table.insert(data.raw["string-setting"]["cupric-asteroids-cupric-triproduct"].allowed_values, "titanium-ore")
  table.insert(data.raw["string-setting"]["cupric-asteroids-metallic-byproduct"].allowed_values, "titanium-ore")
  table.insert(data.raw["string-setting"]["cupric-asteroids-metallic-triproduct"].allowed_values, "titanium-ore")
end

if mods["bztin"] then
  data:extend({
    {
      type = "bool-setting",
      name = "cupric-asteroids-tin",
      setting_type = "startup",
      default_value = true,
      order = "c[compat]-b[tin]"
    }
  })
end

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

local function add_byproduct_option(setting_name, item_name)
  local setting = data.raw["string-setting"][setting_name]
  if setting and setting.allowed_values then
    table.insert(setting.allowed_values, item_name)
  end
end

if mods["bztitanium"] then
  add_byproduct_option("cupric-asteroids-cupric-byproduct", "titanium-ore")
  add_byproduct_option("cupric-asteroids-cupric-triproduct", "titanium-ore")
  add_byproduct_option("cupric-asteroids-metallic-byproduct", "titanium-ore")
  add_byproduct_option("cupric-asteroids-metallic-triproduct", "titanium-ore")
end

local function remove_byproduct_option(setting_name, item_name)
  local setting = data.raw["string-setting"][setting_name]
  if setting and setting.allowed_values then
    for i,byproduct_name in pairs(setting.allowed_values) do
      if byproduct_name == item_name then
        table.remove(setting.allowed_values, i)
        return
      end
    end
  end
end

if mods["crushing-industry"] then
  remove_byproduct_option("cupric-asteroids-cupric-byproduct", "stone")
  remove_byproduct_option("cupric-asteroids-cupric-triproduct", "stone")
  remove_byproduct_option("cupric-asteroids-metallic-byproduct", "stone")
  remove_byproduct_option("cupric-asteroids-metallic-triproduct", "stone")
end

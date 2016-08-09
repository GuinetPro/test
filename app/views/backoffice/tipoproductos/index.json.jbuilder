json.array!(@tipoproductos) do |tipoproducto|
  json.extract! tipoproducto, :id, :name
  json.url tipoproducto_url(tipoproducto, format: :json)
end

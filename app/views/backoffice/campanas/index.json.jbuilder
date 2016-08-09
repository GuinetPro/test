json.array!(@campanas) do |campana|
  json.extract! campana, :id, :nombre
  json.url campana_url(campana, format: :json)
end

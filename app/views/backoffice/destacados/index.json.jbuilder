json.array!(@destacados) do |destacado|
  json.extract! destacado, :id, :name
  json.url destacado_url(destacado, format: :json)
end

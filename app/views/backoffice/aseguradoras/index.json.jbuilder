json.array!(@aseguradoras) do |aseguradora|
  json.extract! aseguradora, :id, :name
  json.url aseguradora_url(aseguradora, format: :json)
end

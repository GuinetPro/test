json.array!(@tipovehiculos) do |tipovehiculo|
  json.extract! tipovehiculo, :id, :name
  json.url tipovehiculo_url(tipovehiculo, format: :json)
end

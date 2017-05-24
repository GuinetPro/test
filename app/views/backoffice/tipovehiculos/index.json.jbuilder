json.array!(@tipovehiculos) do |tipovehiculo|
  json.extract! tipovehiculo, :id, :nombre
end

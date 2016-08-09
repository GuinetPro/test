json.array!(@precioAtributo) do |p|
  json.extract! p, :id, :llave, :campo, :valor
end
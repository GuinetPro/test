json.array!(@tipos_vigencia) do |tipo_vigencia|
  json.extract! tipo_vigencia, :id, :nombre
  json.url tipo_vigencia_url(tipo_vigencia, format: :json)
end

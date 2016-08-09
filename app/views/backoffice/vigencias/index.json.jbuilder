json.array!(@vigencias) do |vigencia|
  json.extract! vigencia, :id, :fecha_desde, :fecha_hasta, :nombre, :activado, :tipoVigencia_id, :campana_id
  json.url vigencia_url(vigencia, format: :json)
end

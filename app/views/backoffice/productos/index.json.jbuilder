json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :precio, :activado, :url_compra, :url_poliza, :usuario_id, :tipovehiculo_id, :tipoproducto_id, :aseguradora_id, :destacado_id
  json.url backoffice_producto_url(producto, format: :json)
end

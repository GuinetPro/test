json.array!(@productos) do |pro|
    json.type "Productos"
    json.id pro.id
	  json.url_compra pro.url_compra
  	json.precio pro.precio
    json.activado pro.activado
  	json.url_poliza pro.url_poliza
	  json.tipovehiculo  pro.tipovehiculo.nombre
	  json.tipoproducto  pro.tipoproducto.nombre
	  json.aseguradora  pro.aseguradora.nombre
	  json.aseguradora_imagen  root_url+pro.aseguradora.foto.seguro.url
    if pro.destacado
      json.destacado  pro.destacado.nombre
    end
      
  	json.vigencia pro.vigencias pro.atributo do |v|
      json.campana Campana.find(v.campana_id).nombre
      json.vigencia Tipovigencia.find(v.tipovigencia_id).nombre
    end
    
end

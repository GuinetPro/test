json.array! (@productos) do |pro|

    
    json.type "Productos"
    json.id pro.id
	  json.url_compra pro.url_compra
  	json.precio pro.precio
  	json.url_poliza pro.url_poliza
	  json.tipovehiculo  pro.tipovehiculo.nombre
	  json.tipoproducto  pro.tipoproducto.nombre
	  json.aseguradora  pro.aseguradora.nombre
	  json.aseguradora_imagen  root_url+pro.aseguradora.foto.seguro.url
    json.aseguradora_archivo  pro.aseguradora.archivo
    if pro.destacado
      json.destacado  pro.destacado.nombre
    end
      
    json.vigencia pro.vigencias pro.atributo do |v|
      json.nombre v.nombre
      json.fecha_desde v.fecha_desde
      json.fecha_hasta v.fecha_hasta
      json.fecha_hasta_mouth_abreviada I18n.l(v.fecha_hasta, format: "%b") 
      json.fecha_hasta_year_abreviada v.fecha_hasta.strftime("%Y") 
      json.fecha_hasta_day_abreviada v.fecha_hasta.strftime("%d") 
      json.campana Campana.find(v.campana_id)
      json.vigencia Tipovigencia.find(v.tipovigencia_id)
    end
    
    json.atributos pro.atributo do |review| 
    	json.campo review.campo
    	json.llave review.llave
    	json.valor review.valor
  	end
end

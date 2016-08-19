class Api::V1::ProductosController < Api::V1::MasterApiController
	
	def index
    
    @productos = Producto.where(activado: true,tipovehiculo: params[:vehiculo], tipoproducto: params[:producto] ).order('destacado_id IS NULL ASC , precio  IS NULL ASC, precio ASC')
    
    @attr = []

    respond_to do |format|
	    format.html { redirect_to(backoffice_productos_path) }
	    format.json 
	  end

  end

  # Esta busca productos por los parametros
  # tipovehiculo  integer es el id  del tipo vehiculo
	# tipoproducto integer es el id  del tipo producto
	# aseguradora  integer es el id  de la aseguradora
	# vigencia integer es el id  del tipo vigencia
  # De los  productos activados ordenados por destacado y su precio
  # mostramos la misma informacion de la api productos del index

	def search
      @productos = Producto.joins("INNER JOIN tienevigencias  ON tienevigencias.producto_id = productos.id ")
      				.where(activado: true,tipovehiculo: params[:vehiculo].to_i, tipoproducto: params[:producto].to_i, aseguradora: params[:aseguradora].to_i)
      				.where("tienevigencias.vigencia_id = ?",params[:vigencia].to_i).
      				order('destacado_id IS NULL ASC , precio  IS NULL ASC, precio ASC')
   	  @attr = []

   	  respond_to do |format|
	    format.html { redirect_to(backoffice_productos_path) }
	    format.json  {  render :index }
	  end

    end

end

   
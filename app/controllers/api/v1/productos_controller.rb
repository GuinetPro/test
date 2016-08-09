class Api::V1::ProductosController < Api::V1::MasterApiController
	
	def index
      @productos = Producto.where(activado: true,tipovehiculo: params[:vehiculo], tipoproducto: params[:producto] ).order('destacado_id IS NULL ASC , precio  IS NULL ASC, precio ASC')
    
      @attr = []
    end

end

   
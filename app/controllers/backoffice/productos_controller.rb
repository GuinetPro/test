module Backoffice
  class ProductosController < BackofficeController
    before_action :set_producto, only: [:show , :edit,:update, :destroy]
    before_action :load_Selectores, only: [:new,:edit,:update,:create]
    before_action :carga_AtributosGuardados, only: [:edit,:update]

    # GET /productos
    # GET /productos.json
    def index
      @productos = Producto.all
      @aseguradoras = Aseguradora.all
      @campanas = Campana.all
      @proExcel = Producto.all
      @destacados = Destacado.all
      @tipovehiculo  = Tipovehiculo.all
      # damos la posibildiad segun formato por request
      # entregar html o csv o xls
      respond_to do |format|
        format.html
        format.csv { send_data @proExcel.to_csv }
        format.xls
        format.json { render :index }
      end
    end

    def search
      @productos = Producto.where(tipoproducto_id: params[:id]).page(params[:page]).per(10) 
      render :index
    end

    def duplicate
      @productos        = Producto.new()
      @productosCurrent = Producto.find(params[:id])
      
      @productos.precio          = @productosCurrent.precio
      @productos.usuario_id       = current_usuario.id
      @productos.url_compra      = @productosCurrent.url_compra
      @productos.url_poliza      = @productosCurrent.url_poliza
      @productos.tipovehiculo_id = @productosCurrent.tipovehiculo_id
      @productos.tipoproducto_id = @productosCurrent.tipoproducto_id
      @productos.aseguradora_id  = @productosCurrent.aseguradora_id
      @productos.destacado_id    = @productosCurrent.destacado_id
      @productos.activado        = @productosCurrent.activado

      @attrs     = Atributo.where(producto_id: params[:id])
      @vigencias = Tienevigencia.where(producto_id: params[:id])

      respond_to do |format|
        if @productos.save

          @attrs.each do |attr|
            Atributo.create(producto_id:@productos.id,llave: attr.llave,valor:attr.valor,campo:attr.campo) 
          end

          @vigencias.each do |v|
           Tienevigencia.create(producto_id:@productos.id,vigencia_id:v.vigencia_id)
          end
          
          format.html { redirect_to backoffice_productos_path, notice: 'Tipo vigencia clonada con exito.' }
        else
          format.html { render :new }
        end
      end
    end


    # GET /productos/1
    # GET /productos/1.json
    def show
    end

    # GET /productos/new
    def new
      @producto      = Producto.new
    end

    # GET /productos/1/edit
    def edit
      # atributos guardados por el campo
     
      #@vigenciasGuardadas = HasVigencia.where(producto_id:@producto.id)

    end

    # POST /productos
    def editor_masivo

      contador = 0;

      params["data"]["aseguradora"].each do |valor|
  
          @productos = Producto.select("productos.id,productos.precio")
                      .joins('INNER JOIN aseguradoras  ON aseguradoras.id=productos.aseguradora_id')
                      .joins('INNER  JOIN tienevigencias  ON productos.id = tienevigencias.producto_id')
                      .joins('INNER  JOIN vigencias  ON vigencias.id = tienevigencias.vigencia_id')
                      .where('aseguradora_id  = ? AND vigencias.campana_id =  ?', valor,
                        params["data"]["campana"][contador].to_i)

          if !params["data"]["tipovehiculo"][contador].blank?
          
              @productos = Producto.select("productos.id,productos.precio")
                .joins('INNER JOIN aseguradoras  ON aseguradoras.id=productos.aseguradora_id')
                .joins('INNER  JOIN tienevigencias  ON productos.id = tienevigencias.producto_id')
                .joins('INNER  JOIN vigencias  ON vigencias.id = tienevigencias.vigencia_id')
                .where('productos.aseguradora_id  = ? AND vigencias.campana_id =  ? AND productos.tipovehiculo_id =?', 
                valor,params["data"]["campana"][contador],params["data"]["tipovehiculo"][contador].to_i)
          end


          @vigencias = Vigencia.where(campana_id: params["data"]["campana"][contador].to_i)

          contador += 1;


          @productos.each do |p|
            @producto = Producto.find(p.id)
            
            if !params[:precio].blank?
              @producto.precio = params[:precio]
            end

            if !params[:url_compra].blank?

              @producto.url_compra = params[:url_compra]
            end
      
            if !params[:url_poliza].blank?
              @producto.url_poliza = params[:url_poliza]
            end

            if !params[:tipovehiculo_id].blank?
              @producto.url_poliza = params[:destacado_id]
            end 
                        
            @producto.save

            @vigencias.each do |v|
              Tienevigencia.create(producto_id:p.id,vigencia_id:v.id)
            end


          end

      end 

      respond_to do |format|
            format.json { render json: { "mensaje" => "Efectuado editor masivo"}, status: :ok }
       end

    end


    # POST /productos
    # POST /productos.json
    def create

      @producto                       = Producto.new(producto_params)
      @producto.usuario_id            = current_usuario.id
      @producto.vigencias             = params[:producto][:vigencias]
      @producto.pre                   = params[:producto][:pre]
      @producto.compraAtributo        = params[:producto][:compraAtributo]
      @producto.polizaAtributo        = params[:producto][:polizaAtributo]
      @producto.tipovehiculoAtributo  = params[:producto][:tipovehiculoAtributo]
      @producto.tipoproductoAtributo  = params[:producto][:tipoproductoAtributo]
      @producto.aseguradoraAtributo   = params[:producto][:aseguradoraAtributo]
      @producto.destacadoAtributo     = params[:producto][:destacadoAtributo]
      @producto.vigenciaAtributo      = params[:producto][:vigenciaAtributo]
      

      respond_to do |format|
        if @producto.save
          format.html { redirect_to backoffice_productos_path, notice: 'Producto creado con exito.' }
          format.json { render :show, status: :created, location: @producto }
        else
          format.html { render :new }
          format.json { render json: @producto.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /productos/1
    # PATCH/PUT /productos/1.json
    def update

      @producto.pre                   = params[:producto][:pre]
      @producto.compraAtributo        = params[:producto][:compraAtributo]
      @producto.polizaAtributo        = params[:producto][:polizaAtributo]
      @producto.tipovehiculoAtributo  = params[:producto][:tipovehiculoAtributo]
      @producto.tipoproductoAtributo  = params[:producto][:tipoproductoAtributo]
      @producto.aseguradoraAtributo   = params[:producto][:aseguradoraAtributo]
      @producto.destacadoAtributo     = params[:producto][:destacadoAtributo]
      @producto.vigenciaAtributo      = params[:producto][:vigenciaAtributo]
      
      @producto.vigencias              = params[:producto][:vigencias]


      respond_to do |format|
        if @producto.update(producto_params)
          format.html { redirect_to backoffice_productos_path, notice: 'Producto modificada con exito.' }
          format.json { render :show, status: :ok, location: @producto }
        else
          format.html { render :edit }
          format.json { render json: @producto.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /productos/1
    # DELETE /productos/1.json
  def destroy
  
    @a =  Atributo.where( producto_id: @producto.id)
    @a.each do |o|
      o.delete
    end
  
    @t = Tienevigencia.where(producto_id:@producto.id)
    @t.each do |o|
     o.delete
    end
  
      @producto.destroy
      respond_to do |format|
        format.html { redirect_to backoffice_productos_path, notice: 'Producto eliminada con exito.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_producto
        @producto = Producto.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def producto_params
        params.require(:producto).permit( :precio, :activado, :url_compra, :url_poliza, :tipovehiculo_id, :tipoproducto_id, :aseguradora_id, :destacado_id,:pre,:compraAtributo,:polizaAtributo,:tipovehiculoAtributo,:aseguradoraAtributo,:destacadoAtributo,:vigenciaAtributo,:vigencias,:proximo)
      end

      #cargamos los selectores con sus datos
      def load_Selectores
        @tipovehiculo  = Tipovehiculo.all
        @tipoproducto  = Tipoproducto.all
        @aseguradora   = Aseguradora.all
        @destacado     = Destacado.all
        @vigencia      = Vigencia.where( activado: true).order("orden ASC")
      end

      #Cargamos los atributos que fueron guardados para desoplegarse en al vista
      def carga_AtributosGuardados
          @precioAtributo       = Atributo.where(producto_id: @producto.id,campo: "precio" )
          @compraAtributo       = Atributo.where(producto_id: @producto.id,campo: "compra" )
          @polizaAtributo       = Atributo.where(producto_id: @producto.id,campo: "poliza" )
          @tipovehiculoAtributo = Atributo.where(producto_id: @producto.id,campo: "tipovehiculo" )
          @tipoproductoAtributo = Atributo.where(producto_id: @producto.id,campo: "tipoproducto" )
          @aseguradoraAtributo  = Atributo.where(producto_id: @producto.id,campo: "aseguradora" )
          @destacadoAtributo    = Atributo.where(producto_id: @producto.id,campo: "destacado" )
          @vigenciaAtributo     = Atributo.where(producto_id: @producto.id,campo: "vigencia" )
      end
  end
end

module Backoffice
  class TipovehiculosController < BackofficeController
    before_action :set_tipovehiculo, only: [:show, :edit, :update, :destroy]

    # GET /tipovehiculos
    # GET /tipovehiculos.json
    def index
      @tipovehiculos = Tipovehiculo.page(params[:page]).per(10) 
    end

    # GET /tipovehiculos/1
    # GET /tipovehiculos/1.json
    def show
    end

    # GET /tipovehiculos/new
    def new
      @tipovehiculo = Tipovehiculo.new
    end

    # GET /tipovehiculos/1/edit
    def edit
    end

    # POST /tipovehiculos
    # POST /tipovehiculos.json
    def create
      @tipovehiculo = Tipovehiculo.new(tipovehiculo_params)

      respond_to do |format|
        if @tipovehiculo.save
          format.html { redirect_to backoffice_tipovehiculos_path, notice: 'Tipovehiculo creado con exito.' }
          format.json { render :show, status: :created, location: @tipovehiculo }
        else
          format.html { render :new }
          format.json { render json: @tipovehiculo.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tipovehiculos/1
    # PATCH/PUT /tipovehiculos/1.json
    def update
      respond_to do |format|
        if @tipovehiculo.update(tipovehiculo_params)
          format.html { redirect_to backoffice_tipovehiculos_path, notice: 'Tipovehiculo modificada con exito.' }
          format.json { render :show, status: :ok, location: @tipovehiculo }
        else
          format.html { render :edit }
          format.json { render json: @tipovehiculo.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tipovehiculos/1
    # DELETE /tipovehiculos/1.json
    def destroy
      respond_to do |format|
          if @tipovehiculo.destroy
            format.html { redirect_to backoffice_tipovehiculos_path, notice: 'Tipovehiculo eliminada con exito.' }
          else
            format.html { redirect_to backoffice_tipovehiculos_path, alert: 'Error al eliminar Tipovehiculo asociada a un Producto.' }
          end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tipovehiculo
        @tipovehiculo = Tipovehiculo.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tipovehiculo_params
        params.require(:tipovehiculo).permit(:nombre)
      end
  end
end
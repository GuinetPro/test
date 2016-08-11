module Backoffice
  class TipoproductosController < BackofficeController
    before_action :set_tipoproducto, only: [:show, :edit, :update, :destroy]

    # GET /tipoproductos
    # GET /tipoproductos.json
    def index
      @tipoproductos = Tipoproducto.page(params[:page]).per(10) 
    end

    # GET /tipoproductos/1
    # GET /tipoproductos/1.json
    def show
    end

    # GET /tipoproductos/new
    def new
      @tipoproducto = Tipoproducto.new
    end

    # GET /tipoproductos/1/edit
    def edit
    end

    # POST /tipoproductos
    # POST /tipoproductos.json
    def create
      @tipoproducto = Tipoproducto.new(tipoproducto_params)

      respond_to do |format|
        if @tipoproducto.save
          format.html { redirect_to backoffice_tipoproductos_path, notice: 'Tipoproducto creado con exito.' }
          format.json { render :show, status: :created, location: @tipoproducto }
        else
          format.html { render :new }
          format.json { render json: @tipoproducto.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tipoproductos/1
    # PATCH/PUT /tipoproductos/1.json
    def update
      respond_to do |format|
        if @tipoproducto.update(tipoproducto_params)
          format.html { redirect_to backoffice_tipoproductos_path, notice: 'Tipoproducto modificada con exito.' }
          format.json { render :show, status: :ok, location: @tipoproducto }
        else
          format.html { render :edit }
          format.json { render json: @tipoproducto.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tipoproductos/1
    # DELETE /tipoproductos/1.json
    def destroy

      respond_to do |format|
          if @tipoproducto.destroy
            format.html { redirect_to backoffice_tipoproductos_path, notice: 'Tipoproducto eliminada con exito.' }
          else
            format.html { redirect_to backoffice_tipoproductos_path, alert: 'Error al eliminar Tipoproducto asociada a un Producto.' }
          end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tipoproducto
        @tipoproducto = Tipoproducto.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tipoproducto_params
        params.require(:tipoproducto).permit(:nombre)
      end
  end
end
module Backoffice
  class TipovigenciasController < BackofficeController
    before_action :set_tipo_vigencia, only: [:show, :edit, :update, :destroy]

    # GET /tipos_vigencia
    # GET /tipos_vigencia.json
    def index
      @tipos_vigencia = Tipovigencia.order("orden ASC").page(params[:page]).per(10) 
    end

    # GET /tipos_vigencia/1
    # GET /tipos_vigencia/1.json
    def show
    end

    # GET /tipos_vigencia/new
    def new
      @tipovigencia = Tipovigencia.new
    end

    # GET /tipos_vigencia/1/edit
    def edit
    end


    
    # POST /tipos_vigencia
    # POST /tipos_vigencia.json
    def create
      @tipovigencia = Tipovigencia.new(tipovigencia_params)

      respond_to do |format|
        if @tipovigencia.save
          format.html { redirect_to backoffice_tipovigencias_path, notice: 'Tipo vigencia  creado con exito.' }
          format.json { render :show, status: :created, location: @tipovigencia }
        else
          format.html { render :new }
          format.json { render json: @tipovigencia.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tipos_vigencia/1
    # PATCH/PUT /tipos_vigencia/1.json
    def update
      respond_to do |format|
        if @tipovigencia.update(tipovigencia_params)
          format.html { redirect_to backoffice_tipovigencias_path, notice: 'Tipo vigencia modificada con exito.' }
          format.json { render :show, status: :ok, location: @tipo_vigencia }
        else
          format.html { render :edit }
          format.json { render json: @tipovigencia.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tipos_vigencia/1
    # DELETE /tipos_vigencia/1.json
    def destroy

      respond_to do |format|
          if @tipovigencia.destroy
            format.html { redirect_to backoffice_tipovigencias_path, notice: 'Tipo vigencia eliminada con exito.' }
          else
            format.html { redirect_to backoffice_tipovigencias_path, alert: 'Error al eliminar Tipo vigencia asociada a una Vigencia.' }
          end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tipo_vigencia
        @tipovigencia = Tipovigencia.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tipovigencia_params
        params.require(:tipovigencia).permit(:nombre,:orden)
      end
  end
end
module Backoffice
  class VigenciasController < BackofficeController
    before_action :set_vigencia, only: [:show, :edit, :update, :destroy]
    before_action :load_selectores, only: [:new, :edit, :update, :create]


    # GET /vigencias
    # GET /vigencias.json
    def index
      @vigencias = Vigencia.page(params[:page]).per(10) 
    end

    def search
      @vigencias = Vigencia.where(tipovigencia_id: params[:id]).page(params[:page]).per(10) 
      render :index
    end

    # GET /vigencias/1
    # GET /vigencias/1.json
    def show
    end

    # GET /vigencias/new
    def new
      @vigencia = Vigencia.new

    end

    # GET /vigencias/1/edit
    def edit
    end

    # POST /vigencias
    # POST /vigencias.json
    def create
      
      @vigencia = Vigencia.new(vigencia_params)
      respond_to do |format|
        if @vigencia.save
          format.html { redirect_to backoffice_vigencias_path, notice: 'Vigencia creado con exito.' }
          format.json { render :show, status: :created, location: @vigencia }
        else
          format.html { render :new }
          format.json { render json: @vigencia.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /vigencias/1
    # PATCH/PUT /vigencias/1.json
    def update
      respond_to do |format|
        if @vigencia.update(vigencia_params)
          format.html { redirect_to backoffice_vigencias_path, notice: 'Vigencia modificada con exito.' }
          format.json { render :show, status: :ok, location: @vigencia }
        else
          format.html { render :edit }
          format.json { render json: @vigencia.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /vigencias/1
    # DELETE /vigencias/1.json
    def destroy

      respond_to do |format|
          if @vigencia.destroy
            format.html { redirect_to backoffice_vigencias_path, notice: 'Vigencia eliminada con exito.' }
          else
            format.html { redirect_to backoffice_vigencias_path, alert: 'Error al eliminar Vigencia asociada a un Producto.' }
          end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_vigencia
        @vigencia = Vigencia.find(params[:id])
      end

      def load_selectores
        @campana      = Campana.all
        @tipovigencia = Tipovigencia.all
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def vigencia_params
        params.require(:vigencia).permit(:fecha_desde, :fecha_hasta, :activado, :tipovigencia_id, :campana_id, :nombre,:orden)
      end
  end
end

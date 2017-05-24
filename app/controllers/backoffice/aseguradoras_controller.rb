module Backoffice
  class AseguradorasController < BackofficeController
    before_action :set_aseguradora, only: [:show, :edit, :update, :destroy]

    # GET /aseguradoras
    # GET /aseguradoras.json
    def index
      @aseguradoras = Aseguradora.page(params[:page]).per(10) 
    end

    # GET /aseguradoras/1
    # GET /aseguradoras/1.json
    def show
    end

    # GET /aseguradoras/new
    def new
      @aseguradora = Aseguradora.new
    end

    # GET /aseguradoras/1/edit
    def edit
      @paginas = Pagina.all
    end

    # POST /aseguradoras
    # POST /aseguradoras.json
    def create
      @aseguradora = Aseguradora.new(aseguradora_params)

      respond_to do |format|
        if @aseguradora.save
          format.html { redirect_to backoffice_aseguradoras_path, notice: 'Aseguradora creado con exito.' }
          format.json { render :show, status: :created, location: @aseguradora }
        else
          format.html { render :new }
          format.json { render json: @aseguradora.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /aseguradoras/1
    # PATCH/PUT /aseguradoras/1.json
    def update
      respond_to do |format|
        if @aseguradora.update(aseguradora_params)
          format.html { redirect_to backoffice_aseguradoras_path, notice: 'Aseguradora modificada con exito.' }
          format.json { render :show, status: :ok, location: @aseguradora }
        else
          format.html { render :edit }
          format.json { render json: @aseguradora.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /aseguradoras/1
    # DELETE /aseguradoras/1.json
    def destroy
      respond_to do |format|
          if @aseguradora.destroy
            format.html { redirect_to backoffice_aseguradoras_path, notice: 'Aseguradora eliminada con exito.' }
          else
            format.html { redirect_to backoffice_aseguradoras_path, alert: 'Error al eliminar Aseguradora asociada a un Producto.' }
          end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_aseguradora
        @aseguradora = Aseguradora.find(params[:id])

      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def aseguradora_params
        params.require(:aseguradora).permit(:nombre, :foto)
      end
  end
end
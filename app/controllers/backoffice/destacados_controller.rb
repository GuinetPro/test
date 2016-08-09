module Backoffice
  class DestacadosController < BackofficeController
    before_action :set_destacado, only: [:show, :edit, :update, :destroy]

    # GET /destacados
    # GET /destacados.json
    def index
      @destacados = Destacado.page(params[:page]).per(10) 
    end

    # GET /destacados/1
    # GET /destacados/1.json
    def show
    end

    # GET /destacados/new
    def new
      @destacado = Destacado.new
    end

    def duplicate
      @destacado        = Destacado.new()
      @destacadoCurrent = Destacado.find(params[:id])
      @destacado.nombre = @destacadoCurrent.nombre
      respond_to do |format|
        if @destacado.save
          format.html { redirect_to backoffice_destacados_path, notice: 'Destacado clonada con exito.' }
        else
          format.html { render :new }
        end
      end
    end
    
    # GET /destacados/1/edit
    def edit
    end

    # POST /destacados
    # POST /destacados.json
    def create
      @destacado = Destacado.new(destacado_params)

      respond_to do |format|
        if @destacado.save
          format.html { redirect_to backoffice_destacados_path, notice: 'Destacado creado con exito.' }
          format.json { render :show, status: :created, location: @destacado }
        else
          format.html { render :new }
          format.json { render json: @destacado.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /destacados/1
    # PATCH/PUT /destacados/1.json
    def update
      respond_to do |format|
        if @destacado.update(destacado_params)
          format.html { redirect_to backoffice_destacados_path, notice: 'Destacado modificada con exito.' }
          format.json { render :show, status: :ok, location: @destacado }
        else
          format.html { render :edit }
          format.json { render json: @destacado.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /destacados/1
    # DELETE /destacados/1.json
    def destroy
      @destacado.destroy
      respond_to do |format|
        format.html { redirect_to backoffice_destacados_path, notice: 'Destacado eliminada con exito.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_destacado
        @destacado = Destacado.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def destacado_params
        params.require(:destacado).permit(:nombre)
      end
  end
end
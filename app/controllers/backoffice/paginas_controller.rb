module Backoffice
  class PaginasController < BackofficeController
    before_action :set_pagina, only: [:show, :edit, :update, :destroy]
    before_action :set_data, only: [:new, :create, :edit, :update,]

    # GET /paginas
    # GET /paginas.json
    def index
      @paginas = Pagina.all
    end

    # GET /paginas/1
    # GET /paginas/1.json
    def show
    end

    # GET /paginas/new
    def new
        @pagina = Pagina.new
    end

    # GET /paginas/1/edit
    def edit
    end

    # POST /paginas
    # POST /paginas.json
    def create
      @pagina = Pagina.new(pagina_params)

      respond_to do |format|
        if @pagina.save
          format.html { redirect_to backoffice_paginas_path, notice: 'Pagina fue creada  con exito.' }
          format.json { render :show, status: :created, location: @pagina }
        else
          format.html { render :new }
          format.json { render json: @pagina.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /paginas/1
    # PATCH/PUT /paginas/1.json
    def update
      respond_to do |format|
        if @pagina.update(pagina_params)
          format.html { redirect_to backoffice_paginas_path, notice: 'Pagina fue modificada  con exito.' }
          format.json { render :show, status: :ok, location: @pagina }
        else
          format.html { render :edit }
          format.json { render json: @pagina.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /paginas/1
    # DELETE /paginas/1.json
    def destroy
      @pagina.destroy
      respond_to do |format|
        format.html { redirect_to backoffice_paginas_path, notice: 'Pagina fue destruida  con exito.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_pagina
        @pagina = Pagina.find(params[:id])
      end

      def set_data
        @tipovehiculo  = Tipovehiculo.all
        @campana       = Campana.all
        @my_app        = MyApp.all
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def pagina_params
        params.require(:pagina).permit(:nombre, :tipovehiculo_id, :campana_id, :my_app_id)
      end
  end
end
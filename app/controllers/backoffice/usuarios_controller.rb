module Backoffice
	class UsuariosController < ApplicationController

		before_action :set_usuario, only: [:edit, :update, :destroy]
		# GET /productos
	    # GET /productos.json
	    def index
	      @usuarios = Usuario.page(params[:page]).per(10) 
	    end

	    # GET /tipos_vigencia/new
	    def new
	      @user = Usuario.new
	    end


	    # POST /my_apps
	    # POST /my_apps.json
	    def create
	      @user = Usuario.new(usuario_params) 
	      respond_to do |format|
	        if @user.save
	          format.html { redirect_to backoffice_usuarios_path, notice: 'Usuario creado con exito.' }
	          format.json { render :show, status: :created, location: @my_app }
	        else
	          format.html { render :new }
	          format.json { render json: @user.errors, status: :unprocessable_entity }
	        end
	      end
	    end

		
		def edit
    	end


	    # PATCH/PUT /tipos_vigencia/1
	    # PATCH/PUT /tipos_vigencia/1.json
	    def update
	      respond_to do |format|
	        if @user.update(usuario_params)
	          format.html { redirect_to backoffice_usuarios_path, notice: 'Usuario modificado con exito.' }
	          format.json { render :show, status: :ok, location: @user }
	        else
	          format.html { render :edit }
	          format.json { render json: @user.errors, status: :unprocessable_entity }
	        end
	      end
	    end


	    # DELETE /tipos_vigencia/1
	    # DELETE /tipos_vigencia/1.json
	    def destroy
	      @user.destroy
	      respond_to do |format|
	        format.html { redirect_to backoffice_usuarios_path, notice: 'Usuario eliminado con exito.' }
	        format.json { head :no_content }
	      end
	    end


    	private
	      # Use callbacks to share common setup or constraints between actions.
	      def set_usuario
	        @user = Usuario.find(params[:id])
	      end

	      # Never trust parameters from the scary internet, only allow the white list through.
	      def usuario_params
	        params.require(:usuario).permit(:email,:rut,:password,:password_confirmation,:perfil)
	      end

	end
end
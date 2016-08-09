class Api::V1::MasterApiController < ApplicationController
	
	layout "api/v1/application"

	after_action :cors_set_access_control_headers
	before_action :set_jbuilder_defaults
	before_action :authenticate_app, except: [:xhr_options_request]

	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = "*"
		headers['Access-Control-Allow-Methods'] = "GET,POST,OPTIONS"
		headers['Access-Control-Allow-Headers'] = 'Origin,Content-Type,Authorization,Token'
	end

	def xhr_options_request
		head :ok
	end

	protected
	
	def set_jbuilder_defaults
		@errors = []
	end	

	def authenticate_app
		if params.has_key?(:app_id)
			@my_app = MyApp.find_by(app_id: params[:app_id])
			if @my_app.nil?
				error!("App ID inválido u origen incorrecto",:unauthorized)
			end
		elsif params.has_key?(:secret_key)
			@my_app = MyApp.find_by(secret_key: params[:secret_key])
			if @my_app.nil?
				error!("Secret key inválido",:unauthorized)
			end
		else
			error!("Necesitas una aplicación para comunicarte con el API", :unauthorized)
		end
	end


	 def error!(message,status)
	    @errors << message
	    response.status = status
	    render template: "api/v1/errors"
	 end

	 def error_array!(array,status)
	    @errors = @errors + array
	    response.status = status
	    render "api/v1/errors"
	end


end
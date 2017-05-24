Rails.application.routes.draw do

  
  
  root to: 'backoffice/productos#index'
  #devise_for :usuarios

  devise_for :usuarios, path: "auth", path_names: { sign_in: 'login' }

  namespace :api do
    namespace :v1 do
      resources :productos
      get '/search' => "productos#search"
      
      
    end
  end

  namespace :backoffice do
    resources :campanas
    resources :productos
    resources :tipoproductos
    resources :tipovehiculos
    resources :destacados
    resources :aseguradoras
    resources :tipovigencias
    resources :vigencias
    resources :my_apps
    resources :usuarios
    resources :archivos
    resources :paginas
    #buscador
    get '/productos/search/:id'      => "productos#search"
    get '/vigencias/search/:id'      => "vigencias#search"
    #rutas para duplicar
    get '/productos/duplicate/:id'     => "productos#duplicate"
    
    post '/productos/editor_masivo/:aseguradora_id/:campana_id' => "productos#editor_masivo"
  end

end

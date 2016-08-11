Rails.application.routes.draw do

  root to: 'backoffice/productos#index'
  #devise_for :usuarios

  devise_for :usuarios, path: "auth", path_names: { sign_in: 'login' }

  namespace :api do
    namespace :v1 do
      resources :productos
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
    #buscador
    get '/productos/search/:id'      => "productos#search"
    get '/vigencias/search/:id'      => "vigencias#search"
    #rutas para duplicar
    get '/productos/duplicate/:id'     => "productos#duplicate"

  end

end

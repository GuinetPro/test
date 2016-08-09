Rails.application.routes.draw do

  root to: 'backoffice/productos#index'
  devise_for :usuarios

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
    get '/campanas/duplicate/:id'      => "campanas#duplicate"
    get '/productos/duplicate/:id'     => "productos#duplicate"
    get '/tipoproductos/duplicate/:id' => "tipoproductos#duplicate"
    get '/tipovehiculos/duplicate/:id' => "tipovehiculos#duplicate"
    get '/tipovigencias/duplicate/:id' => "tipovigencias#duplicate"
    get '/destacados/duplicate/:id'    => "destacados#duplicate"
    get '/aseguradoras/duplicate/:id'  => "aseguradoras#duplicate"
    get '/vigencias/duplicate/:id'     => "vigencias#duplicate"

  end

end

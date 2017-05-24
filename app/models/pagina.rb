class Pagina < ActiveRecord::Base

  validates :campana_id, presence: true
  validates :tipovehiculo_id, presence: true
  validates :my_app_id, presence: true
	
end

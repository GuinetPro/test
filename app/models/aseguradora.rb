class Aseguradora < ActiveRecord::Base
	mount_uploader :foto, FotoUploader
	validates :nombre, presence: true
end

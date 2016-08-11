class Aseguradora < ActiveRecord::Base
	mount_uploader :foto, FotoUploader
	validates :nombre, presence: true

	before_destroy :validate_relation?


   private

   def validate_relation?
      Producto.where( aseguradora_id: self.id ).empty?  
   end

end

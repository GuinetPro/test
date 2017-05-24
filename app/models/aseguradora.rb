class Aseguradora < ActiveRecord::Base
	mount_uploader :foto, FotoUploader
	validates :nombre, presence: false
	#serialize :foto, JSON 
	before_destroy :validate_relation?

	has_many :archivo, :foreign_key => :aseguradoras_id
   private

   def validate_relation?
      Producto.where( aseguradora_id: self.id ).empty?  
   end

end

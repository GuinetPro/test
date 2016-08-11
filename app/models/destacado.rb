class Destacado < ActiveRecord::Base
	validates :nombre, presence: true

   before_destroy :validate_relation?
   
   private

   def validate_relation?
      Producto.where( destacado_id: self.id ).empty?  
   end
end

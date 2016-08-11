class Tipovehiculo < ActiveRecord::Base
   validates :nombre, presence: true

   before_destroy :validate_relation?
   
   private

   def validate_relation?
      Producto.where( tipovehiculo_id: self.id ).empty?  
   end

end

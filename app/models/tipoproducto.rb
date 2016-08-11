class Tipoproducto < ActiveRecord::Base
	validates :nombre, presence: true


   before_destroy :validate_relation?


   private

   def validate_relation?
      Producto.where( tipoproducto_id: self.id ).empty?  
   end

end

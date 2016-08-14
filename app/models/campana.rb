class Campana < ActiveRecord::Base
	validates :nombre, presence: true

   before_destroy :validate_relation?
   
   private

   def validate_relation?
      Vigencia.where( campana_id: self.id ).empty?  
   end
end

class Tipovigencia < ActiveRecord::Base
	validates :nombre, presence: true


   before_destroy :validate_relation?
   
	private

   def validate_relation?
      Vigencia.where( tipovigencia_id: self.id ).empty?  
   end

end

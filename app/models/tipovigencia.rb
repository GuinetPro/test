class Tipovigencia < ActiveRecord::Base
	validates :nombre, presence: true
end

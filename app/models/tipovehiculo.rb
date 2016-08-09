class Tipovehiculo < ActiveRecord::Base
	validates :nombre, presence: true
end

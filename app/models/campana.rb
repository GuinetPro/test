class Campana < ActiveRecord::Base
	validates :nombre, presence: true
end

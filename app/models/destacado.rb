class Destacado < ActiveRecord::Base
	validates :nombre, presence: true
end

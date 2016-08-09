class Tipoproducto < ActiveRecord::Base
	validates :nombre, presence: true
end

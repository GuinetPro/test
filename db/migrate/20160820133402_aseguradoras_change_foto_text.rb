class AseguradorasChangeFotoText < ActiveRecord::Migration
	def change
	    change_column(:aseguradoras, :foto, :text)
	end
end

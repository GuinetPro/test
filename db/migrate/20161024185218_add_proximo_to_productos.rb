class AddProximoToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :proximo, :boolean, :default => false
  end
end

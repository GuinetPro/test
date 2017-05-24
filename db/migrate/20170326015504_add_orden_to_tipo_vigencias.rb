class AddOrdenToTipoVigencias < ActiveRecord::Migration
  def change
    add_column :tipovigencias, :orden, :int
  end
end

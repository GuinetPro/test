class AddOrdenToVigencias < ActiveRecord::Migration
  def change
    add_column :vigencias, :orden, :int
  end
end

class CreateTipoproductos < ActiveRecord::Migration
  def change
    create_table :tipoproductos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
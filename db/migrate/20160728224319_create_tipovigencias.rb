class CreateTipovigencias < ActiveRecord::Migration
  def change
    create_table :tipovigencias do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end

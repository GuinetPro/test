class CreateTipovehiculos < ActiveRecord::Migration
  def change
    create_table :tipovehiculos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end

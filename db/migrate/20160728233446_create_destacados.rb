class CreateDestacados < ActiveRecord::Migration
  def change
    create_table :destacados do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end

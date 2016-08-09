class CreateAseguradoras < ActiveRecord::Migration
  def change
    create_table :aseguradoras do |t|
      t.string :nombre
      t.string :foto
      t.timestamps null: false
    end
  end
end

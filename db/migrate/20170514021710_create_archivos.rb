class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.references :aseguradoras, index: true, foreign_key: true
      t.string :foto

      t.timestamps null: false
    end
  end
end

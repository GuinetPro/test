class CreateVigencias < ActiveRecord::Migration
  def change
    create_table :vigencias do |t|
      t.datetime :fecha_desde
      t.datetime :fecha_hasta
      t.string :nombre
      t.boolean :activado
      t.references :tipovigencia, index: true, foreign_key: true
      t.references :campana, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

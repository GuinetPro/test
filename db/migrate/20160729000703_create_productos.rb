class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :precio
      t.boolean :activado
      t.string :url_compra
      t.string :url_poliza
      t.references :usuario, index: true, foreign_key: true
      t.references :tipovehiculo, index: true, foreign_key: true
      t.references :tipoproducto, index: true, foreign_key: true
      t.references :aseguradora, index: true, foreign_key: true
      t.references :destacado, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

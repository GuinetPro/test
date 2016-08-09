class CreateAtributos < ActiveRecord::Migration
  def change
    create_table :atributos do |t|
      t.string :campo
      t.string :llave
      t.string :valor
      t.references :producto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

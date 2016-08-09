class CreateTienevigencias < ActiveRecord::Migration
  def change
    create_table :tienevigencias do |t|
      t.references :producto, index: true, foreign_key: true
      t.references :vigencia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

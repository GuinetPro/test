class CreateTokenes < ActiveRecord::Migration
  def change
    create_table :tokenes do |t|
      t.references :my_app, index: true, foreign_key: true
      t.string :token
      t.datetime :experies_at

      t.timestamps null: false
    end
  end
end

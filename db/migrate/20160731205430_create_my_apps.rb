class CreateMyApps < ActiveRecord::Migration
  def change
    create_table :my_apps do |t|
      t.references :usuario, index: true, foreign_key: true
      t.string :titulo
      t.string :app_id
      t.string :javascript_origins
      t.string :secret_key

      t.timestamps null: false
    end
  end
end

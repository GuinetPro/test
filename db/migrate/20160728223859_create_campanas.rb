class CreateCampanas < ActiveRecord::Migration
  def change
    create_table :campanas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end

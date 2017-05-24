class CreatePaginas < ActiveRecord::Migration
  def change
    create_table :paginas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end

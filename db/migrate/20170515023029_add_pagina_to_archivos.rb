class AddPaginaToArchivos < ActiveRecord::Migration
  def change
    add_column :archivos, :pagina, :integer
  end
end

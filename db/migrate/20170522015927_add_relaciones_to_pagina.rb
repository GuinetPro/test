class AddRelacionesToPagina < ActiveRecord::Migration
  def change
    add_reference :paginas, :tipovehiculo, index: true, foreign_key: true
    add_reference :paginas, :campana, index: true, foreign_key: true
    add_reference :paginas, :my_app, index: true, foreign_key: true
  end
end

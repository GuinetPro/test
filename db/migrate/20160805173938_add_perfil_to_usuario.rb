class AddPerfilToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :perfil, :string
  end
end

class RemoveColumnTipoFromTableVeiculos < ActiveRecord::Migration[7.0]
  def change
    remove_column :veiculos, :tipo
  end
end

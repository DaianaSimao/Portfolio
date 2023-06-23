class AddColumnTipoFromTableVeiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :veiculos, :tipo, :string
  end
end

class AddColumnTipoFromTablePrecos < ActiveRecord::Migration[7.0]
  def change
    add_column :precos, :tipo, :string
  end
end

class RemoveReferencesFromTablePreco < ActiveRecord::Migration[7.0]
  def change
    remove_reference :precos, :veiculo, foreign_key: true
  end
end

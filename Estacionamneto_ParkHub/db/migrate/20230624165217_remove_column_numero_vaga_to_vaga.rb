class RemoveColumnNumeroVagaToVaga < ActiveRecord::Migration[7.0]
  def change
    remove_column :vagas, :numero_vaga
  end
end

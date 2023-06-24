class AddColumnVagaToVaga < ActiveRecord::Migration[7.0]
  def change
    add_column :vagas, :vaga, :string
  end
end

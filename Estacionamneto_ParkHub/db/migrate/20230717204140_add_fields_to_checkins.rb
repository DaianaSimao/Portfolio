class AddFieldsToCheckins < ActiveRecord::Migration[7.0]
  def change
    add_column :checkins, :veiculo_placa, :string
    add_column :checkins, :veiculo_modelo, :string
    add_column :checkins, :veiculo_marca, :string
    add_column :checkins, :veiculo_cor, :string
    add_column :checkins, :preco_tipo, :string
    add_column :checkins, :preco_preco_hora, :float
    add_column :checkins, :vaga_vaga_nome, :string
    add_column :checkins, :status, :boolean
  end
end

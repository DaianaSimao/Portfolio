class RemoveReferenresToAluguel < ActiveRecord::Migration[7.0]
  def change
    remove_reference :alugueis, :estacionamento, foreign_key: true

  end
end

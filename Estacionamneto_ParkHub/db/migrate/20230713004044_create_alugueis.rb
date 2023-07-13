class CreateAlugueis < ActiveRecord::Migration[7.0]
  def change
    create_table :alugueis do |t|
      t.references :estacionamento, null: false, foreign_key: true
      t.date :hora_saida
      t.float :preco_final

      t.timestamps
    end
  end
end

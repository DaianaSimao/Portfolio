class CreateEstacionamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :estacionamentos do |t|
      t.references :veiculo, null: false, foreign_key: true
      t.references :vaga, null: false, foreign_key: true
      t.references :preco, null: false, foreign_key: true

      t.timestamps
    end
  end
end

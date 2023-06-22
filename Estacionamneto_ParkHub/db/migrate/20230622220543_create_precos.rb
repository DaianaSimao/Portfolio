class CreatePrecos < ActiveRecord::Migration[7.0]
  def change
    create_table :precos do |t|
      t.references :veiculo, null: false, foreign_key: true
      t.float :preco_hora

      t.timestamps
    end
  end
end

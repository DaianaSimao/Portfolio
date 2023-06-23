class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.date :hora_entrada, null: true
      t.date :hora_saida, null: true
      t.float :valor_cobrado
      t.references :veiculo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
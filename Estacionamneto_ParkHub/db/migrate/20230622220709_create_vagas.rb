class CreateVagas < ActiveRecord::Migration[7.0]
  def change
    create_table :vagas do |t|
      t.string :andar
      t.integer :numero_vaga

      t.timestamps
    end
  end
end

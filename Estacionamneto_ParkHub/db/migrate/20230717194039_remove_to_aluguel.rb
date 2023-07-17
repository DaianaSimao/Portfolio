class RemoveToAluguel < ActiveRecord::Migration[7.0]
  def change
    drop_table :alugueis
  end
end

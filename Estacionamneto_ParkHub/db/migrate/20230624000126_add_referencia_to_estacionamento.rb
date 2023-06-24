class AddReferenciaToEstacionamento < ActiveRecord::Migration[7.0]
  def change
    add_reference :estacionamentos, :tickets, null: false, foreign_key: true
  end
end

class AddStatusToVagas < ActiveRecord::Migration[7.0]
  def change
    add_column :vagas, :status, :boolean
  end
end

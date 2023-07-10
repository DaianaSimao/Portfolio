class DropOldTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :admins
    drop_table :funcionarios
  end
end

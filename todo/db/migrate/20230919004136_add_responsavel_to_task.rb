class AddResponsavelToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :responsavel, :string
  end
end

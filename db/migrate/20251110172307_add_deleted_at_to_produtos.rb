class AddDeletedAtToProdutos < ActiveRecord::Migration[8.1]
  def change
    add_column :produtos, :deleted_at, :datetime
  end
end

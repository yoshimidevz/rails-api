class CreateProdutos < ActiveRecord::Migration[8.1]
  def change
    create_table :produtos do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end

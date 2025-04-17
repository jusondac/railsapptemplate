class CreateInventoryTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_transactions do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity_change
      t.string :transaction_type
      t.text :notes

      t.timestamps
    end
  end
end

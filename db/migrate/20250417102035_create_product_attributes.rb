class CreateProductAttributes < ActiveRecord::Migration[8.0]
  def change
    create_table :product_attributes do |t|
      t.references :product, null: false, foreign_key: true
      t.string :attribute_name
      t.string :attribute_value

      t.timestamps
    end
  end
end

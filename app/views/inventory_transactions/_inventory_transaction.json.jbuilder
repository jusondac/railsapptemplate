json.extract! inventory_transaction, :id, :product_id, :quantity_change, :transaction_type, :notes, :created_at, :updated_at
json.url inventory_transaction_url(inventory_transaction, format: :json)

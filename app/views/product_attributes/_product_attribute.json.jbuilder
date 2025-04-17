json.extract! product_attribute, :id, :product_id, :attribute_name, :attribute_value, :created_at, :updated_at
json.url product_attribute_url(product_attribute, format: :json)

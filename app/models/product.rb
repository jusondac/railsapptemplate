class Product < ApplicationRecord
  #              :id => :integer,
  #            :name => :string,
  #     :description => :text,
  #           :price => :decimal,
  #        :quantity => :integer,
  #     :category_id => :integer,
  #      :created_at => :datetime,
  #      :updated_at => :datetime
  #
  belongs_to :category
  has_many :product_attributes, dependent: :destroy
  accepts_nested_attributes_for :product_attributes, allow_destroy: true

  def self.table_columns
    [
      { label: "Name", field: "name", bold: true, type: "string", copiable: true },
      { label: "Description", field: "description", type: "text" },
      { label: "Price", field: "price", type: "decimal" },
      { label: "Quantity", field: "quantity", type: "integer" },
      { label: "Category", field: "category_id", type: "integer", related_model: "category", related_field: "name" },
      { label: "Created At", field: "created_at", strftime: "%b %d, %Y ", form: false, type: "datetime" },
      { label: "Updated At", field: "updated_at", strftime: "%b %d, %Y ", form: false, type: "datetime" }
    ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end
end

class Category < ApplicationRecord
  #          :id => :integer,
  #        :name => :string,
  # :description => :text,
  #  :created_at => :datetime,
  #  :updated_at => :datetime


  def self.table_columns
    [
      { label: "Name", field: "name", bold: true, type: "string", copiable: true },
      { label: "Description", field: "description", type: "text" },
      { label: "Created At", field: "created_at", strftime: "%b %d, %Y ", form: false, type: "datetime" },
      { label: "Updated At", field: "updated_at", strftime: "%b %d, %Y ", form: false, type: "datetime" }
    ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end
end

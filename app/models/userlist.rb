class Userlist < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "username" ]
  end

  def self.table_columns
    [
      { label: "Username", field: "username", bold: true, type: "string" },
      { label: "Email", field: "email", copiable: true, type: "email" },
      { label: "Address", field: "address", bold: true, type: "string" },
      { label: "Created At", field: "created_at", strftime: "%b %d, %Y ", form: false },
      { label: "Updated At", field: "updated_at", strftime: "%b %d, %Y ", form: false }
    ]
  end

  def self.actions_buttons
    [
      { name: "Edit", path: "userlist_path", icon: "edit" },
      { name: "Delete", path: "userlist_path", icon: "trash", method: :delete }
    ]
  end
end

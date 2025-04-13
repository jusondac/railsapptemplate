json.extract! userlist, :id, :username, :email, :address, :created_at, :updated_at
json.url userlist_url(userlist, format: :json)

json.extract! user, :id, :firstname, :lastname, :telephone, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

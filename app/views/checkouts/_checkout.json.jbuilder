json.extract! checkout, :id, :name, :email, :address, :pick_up, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)

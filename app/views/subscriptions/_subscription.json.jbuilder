json.extract! subscription, :id, :name, :phone, :email, :city, :province, :profile, :agree, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)

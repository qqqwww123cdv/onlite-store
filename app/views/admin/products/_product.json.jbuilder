json.extract! product, :id, :product_name, :image, :vendor_code, :price, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
json.image url_for(product.image)

json.extract! admin_product, :id, :product_name, :image, :vendor_code, :price, :description, :created_at, :updated_at
json.url admin_product_url(admin_product, format: :json)
json.image url_for(admin_product.image)

json.extract! listing, :id, :listing_title, :listing_description, :user_id, :price, :condition, :category_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)

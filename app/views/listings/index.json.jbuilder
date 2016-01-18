json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :description, :price, :images
  json.url listing_url(listing, format: :json)
end

json.array!(@covers) do |cover|
  json.extract! cover, :id, :name, :desc, :price, :device
  json.url cover_url(cover, format: :json)
end

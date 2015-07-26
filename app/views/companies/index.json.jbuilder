json.array!(@companies) do |company|
  json.extract! company, :id, :lat, :lng, :address, :name, :type
  json.url company_url(company, format: :json)
end

json.array!(@characters) do |character|
  json.extract! character, :id, :index, :show
  json.url character_url(character, format: :json)
end

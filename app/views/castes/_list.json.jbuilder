castes.each do |caste|
  json.set! caste.id do
    json.name caste.name
    json.icon asset_path("#{caste.name.downcase}24.png")
  end
end

attributes.each do |attribute|
  json.set! attribute.id, attribute.name
end

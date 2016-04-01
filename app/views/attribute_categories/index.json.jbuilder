@attribute_categories.each do |category|
  json.set! category.id do
    json.name category.name
    json.set! 'attributes' do
      json.partial! 'attributes/list', attributes: category.child_attributes
    end
  end
end

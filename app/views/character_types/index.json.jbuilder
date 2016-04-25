@character_types.each do |character_type|
  json.set! character_type.id do
    json.name character_type.name
    json.set! 'castes' do
      json.partial! 'castes/list', castes: character_type.castes
    end
  end
end
